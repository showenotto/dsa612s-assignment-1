import ballerina/io;
import ballerina/http;

type Course readonly & record {
    string name;
    string code;
    string nqf;
};

type Programme record{
    string code;
    string nqf;
    string faculty;
    string department;
    string qualification_title;
    string registration_date;
    Course[] courses;
};


http:Client pdm_client = check new ("localhost:9090");

public function main() returns error?{
    io:println("Welcome to the 'Programme Development Manager'!");
    io:println("-----------------------------------------\n");
    while true {
        string cmd = io:readln("Online-Shopping> ");
        if cmd == "exit" {
            io:println("Goodbye!");
            break;
        }
        _ = check Cmd(cmd);
    }
}
    
function Cmd(string cmd) returns error?{
    match cmd {
        "help" => {
            help();
        }
        "?" => {
            help();
        }
        "add_programme" => {
            //Dummy data!
            //Course course1 = {name: "Applied Statistics & Probability", code: "ASP611S", nqf: "5"};
            //Course course2 = {name: "Operating Systems", code: "OPS611S", nqf: "5"};
            //Programme programme = check pdm_client->/add.post({
            //    code: "07BCMS",
            //    nqf:"7",
            //    faculty: "Computing & Informatics",
            //    department: "Computer Sciences",
            //    qualification_title: "Bachelor of Computer Science (System Administration or Communication Networks)",
            //    registration_date: "02-02-2023",
            //    courses: [course1, course2]
            //});
            io:println("Adding a new programme...");

            string code = io:readln("Code:");
            string nqf = io:readln("NQF:");
            string faculty = io:readln("Faculty:");
            string department = io:readln("Department:");
            string qualification_title = io:readln("Qualification's Title:");
            string registration_date = io:readln("Registrations Date:");
            string input = io:readln("Number of courses: ");
            Programme programme = {
                code: code,
                nqf: nqf,
                faculty: faculty,
                department: department,
                qualification_title: qualification_title,
                registration_date: registration_date,
                courses: []
            };
            int number_of_course = check int:fromString(input);
            foreach int i in 0...number_of_course-1 {
                io:println("[" + (i+1).toString() + "/" + number_of_course.toString() + "] Adding course...");
                string name = io:readln("Name: ");
                string course_code = io:readln("Code: ");
                string course_nqf = io:readln("NQF: ");
                Course course = {name:name, code:course_code, nqf:course_nqf};
                programme.courses.push(course);
            } 
           Programme programme_response = check pdm_client->/add.post(programme); 
           io:println(programme_response);
        }

        "list_all_programmes" => {
            table<Programme> programmes = check pdm_client->/all;
            io:println("All programmes!");
            io:println(programmes);
        }
    }
}

function help(){
    io:println("List of available commands");
    io:println("--------------------------");
    io:println("add_programme");
    io:println("list_all_programmes");
    io:println("update_programme");
    io:println("get_programme");
    io:println("delete_programme");
    io:println("list_all_programmes_due\n");
}