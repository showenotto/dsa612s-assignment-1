import ballerina/http;
import ballerina/time;
import ballerina/io;

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
    resource function get programmes/[string code]() returns Programme|error{
        Programme? programme = self.programmes[code];
        if programme is () {
            return error("Programme with code: " + code + " was not found!");
        }
        return programme;
    }

    resource function get programmes(string faculty) returns Programme|error{
        Programme programme_found = {courses: [], nqf: "", code: "", registration_date: "", department: "", qualification_title: "", faculty: ""};
        boolean ERROR = true;
        self.programmes.forEach(function (Programme programme){
            if (programme.faculty == faculty){
                programme_found = programme;
                ERROR = false;
            }
        });
        if (ERROR){return error("Programme with faculty: " + faculty + " does not exist!");}
        return programme_found;
    }

    resource function get delete(string code) returns Programme{
        Programme programme = self.programmes.remove(code);
        return programme;
    }

    resource function get programmes_due() returns Programme[]|error{
        Programme[] programmes_due = [];
        self.programmes.forEach(function(Programme programme){
            do {
	            if check programmeReviewIsDue(programme.registration_date){
                    programmes_due.push(programme);
	            }
            } on fail var e {
            	io:println(e);
            }
        });
        return programmes_due;
    }
}

function programmeReviewIsDue(string date) returns boolean|error{
    string:RegExp r = re `-`; //Create regex object to split string
    //Programme date formating
    string[] text = r.split(date); // -> ["day", "month", "year"]
    int|error year = int:fromString(text[0]);
    int|error month = int:fromString(text[1]);
    int|error day = int:fromString(text[2]);
    time:Date registration_date = {day:check day, month:check month, year:check year}; //Programme registration date
    //Current date formating
    time:Utc utc = time:utcNow();
    string current_utc = time:utcToString(utc);
    string current_utc_full = current_utc.substring(0,10);
    text = r.split(current_utc_full);
    year = int:fromString(text[0]);
    month = int:fromString(text[1]);
    day = int:fromString(text[2]);
    time:Date current_date = {day:check day, month: check month, year:check year}; //Current date
    
    int programme_run = current_date.year - registration_date.year;
    io:println(programme_run);
    return programme_run > 5 ? true : false;
}
