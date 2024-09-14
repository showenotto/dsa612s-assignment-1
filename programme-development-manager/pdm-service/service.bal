import ballerina/http;

type Course readonly & record {
    string name;
    string code;
    string nqf;

};

type Programme readonly & record{
    string code;
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
}