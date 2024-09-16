import ballerina/http;

type Course readonly & record {
    string name;
    string code;
    string nqf;

};

type Programme record{
    readonly string code;
    string nqf;
    string faculty;
    string department;
    string qualification_title;
    string registration_date;
    Course[] courses;
};
service / on new http:Listener(9090) {
    table<Programme> key(code) programmes = table [];
    resource function post add(Programme programme) returns Programme|error {
        // Send a response back to the caller.
        self.programmes.add(programme);
        return programme;
    }
    resource function get all() returns table<Programme> {
        lock {
            return self.programmes;
        }
    }

     resource function post update(Programme new_programme) returns Programme|error{
        boolean ERROR = true;
        Programme original_programme = {courses: [], nqf: "", code: "", registration_date: "", department: "", qualification_title: "", faculty: ""};
        self.programmes.forEach(function(Programme programme){
            if (programme.code == new_programme.code){
                original_programme = programme;
                ERROR = false;
            }
        });
        if (ERROR){return error("Programme with code: " + new_programme.code + "doesn't exist!");}
        //Update current programme, if input programme field is not null
        if new_programme.nqf != ""{
            original_programme.nqf = new_programme.nqf;
        }
        if new_programme.faculty != ""{
            original_programme.faculty = new_programme.faculty;
        }
        if new_programme.department != ""{
            original_programme.department = new_programme.department;
        }
        if new_programme.qualification_title != ""{
            original_programme.qualification_title = new_programme.qualification_title;
        }
        if new_programme.registration_date != ""{
            original_programme.registration_date = new_programme.registration_date;
        }
        new_programme.courses.forEach(function (Course new_course){
            //Updates exisiting courses found within the programme
            original_programme.courses = from Course old_course in original_programme.courses
                select (new_course.code == old_course.code) //Transforms each element based on the condition
                ? {
                    name: new_course.name != "" ? new_course.name : old_course.name,
                    code: old_course.code, // Code remains the same
                    nqf: new_course.nqf != "" ? new_course.nqf : old_course.nqf
                } //Creates new element if condition is true
                : old_course; //Keep old element if condition is false
        });
        self.programmes.put(original_programme);
        return original_programme;
    }
}