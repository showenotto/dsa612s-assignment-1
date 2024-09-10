import ballerina/io;

//Created Profile class for User Session Management
class Profile {
    string username;
    boolean admin;
    boolean customer;
    boolean guest;

     function init() {
        self.username = "Guest";
        self.admin = false;
        self.customer = false;
        self.guest = true;
    }

    function setUserName(string username){
        self.username = username;
    }
    function setRole(string role){
        if (role == "admin"){
            self.admin = true;
            //Reset other roles
            self.customer = false;
            self.guest = false;
        }
        if (role == "customer"){
            self.customer = true;
            //Reset other roles
            self.admin = false;
            self.guest = false;
        }
        if (role == "guest"){
            self.guest = true;
            //Reset other roles
            self.admin = false;
            self.customer = false;
        }
        
    }
    function getProfile () {
        io:println("Username: " + self.username);
        if (self.admin){
            io:println("Role: Admin");
        }
        if (self.customer){
            io:println("Role: Customer");
        }
        if (self.guest){
            io:println("Role: Guest");
        }
    }
}
OnlineShoppingSystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    io:println("Welcome to the 'Online Shopping System'!");
    io:println("-----------------------------------------\n");
    while true {
        string cmd = io:readln("Online-Shopping> ");
        if cmd == "exit" {
            io:println("Goodbye!");
            break;
        }
        _ = check Cmd(cmd);
    }

    //Product add_productRequest = {sku: "ballerina", code: 1, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
    //int add_productResponse = check ep->add_product(add_productRequest);
    //io:println(add_productResponse);

    //Void list_usersRequest = {};
    //Users list_usersResponse = check ep->list_users(list_usersRequest);
    //io:println(list_usersResponse);

    //Product update_productRequest = {sku: "ballerina", code: 1, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
    //Product update_productResponse = check ep->update_product(update_productRequest);
    //io:println(update_productResponse);

    //int remove_productRequest = 1;
    //Products remove_productResponse = check ep->remove_product(remove_productRequest);
    //io:println(remove_productResponse);

    //Products list_available_productResponse = check ep->list_available_product();
    //io:println(list_available_productResponse);

    //string search_productRequest = "ballerina";
    //Product search_productResponse = check ep->search_product(search_productRequest);
    //io:println(search_productResponse);

    //Cart add_to_cartRequest = {userId: "ballerina", sku: "ballerina"};
    //int add_to_cartResponse = check ep->add_to_cart(add_to_cartRequest);
    //io:println(add_to_cartResponse);

    //int place_orderRequest = 1;
    //Products place_orderResponse = check ep->place_order(place_orderRequest);
    //io:println(place_orderResponse);

    //User create_usersRequest = {id: "ballerina", isAdmin: true, username: "ballerina", firstName: "ballerina", lastName: "ballerina", password: "ballerina"};
    //Create_usersStreamingClient create_usersStreamingClient = check ep->create_users();
    //check create_usersStreamingClient->sendUser(create_usersRequest);
    //check create_usersStreamingClient->complete();
    //User? create_usersResponse = check create_usersStreamingClient->receiveUser();
    //io:println(create_usersResponse);
}

Profile profile = new Profile();
function Cmd(string cmd) returns error?{
    match cmd {
        "help" => {
            help();
        }
        "?" => {
            help();
        }
        //Authentication
        "login" => {
            profile.setRole("admin");
            profile.setUserName("admin");
        }
        "logout" => {
            profile = new Profile();
        }
        "profile" => {
            profile.getProfile();
        }
        //Admin commands
        "add_product" => {
            if (profile.admin){
                io:println("Adding new product...");
                string sku = io:readln("SKU: ");
                string name = io:readln("Name: ");
                string price = io:readln("Price: ");
                string status = io:readln("Status: ");
                string description = io:readln("Description: ");
                string stock_quantity = io:readln("Stock Quantity: ");

                Product add_productRequest = {sku: "ballerina", code: 0, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
                int add_productResponse = check ep->add_product(add_productRequest);
                io:println(add_productResponse);
            }
            else{
                io:println("Access denied!");
            }
        }
        "create_users" => {
            //Todo:Implement
        }
        "update_product" => {
            //Todo:Implement
        }
        "remove_product" => {
            //Todo:Implement
        }
        //Customer commands
        "list_available_products" => {
            //Todo:Implement
        }
        "search_product" => {
            //Todo:Implement
        }
        "add_to_cart" => {
            //Todo:Implement
        }
        "place_order" => {
            //Todo:Implement
        }
    }
}


function help(){
    io:println("List of available commands:");
    io:println("\n---Authentication---");
    io:println("login   - authenticate to the system");
    io:println("logout  - revoke authorization");
    io:println("profile - print user profile");
    io:println("\n---Admin---");
    io:println("add_product    - The admin creates a new product");
    io:println("create_users   - Multiple users (customers or admins) each with a specific profile are created");
    io:println("list_users     - Display list of users");
    io:println("update_product - The admin alters the details of a given product");
    io:println("remove_product - The admin removes a product from the inventory ");
    io:println("\n---Customer---");
    io:println("list_available_products - The customer gets a list of all the available products");
    io:println("search_product          - The customer searches for a product based on its SKU");
    io:println("add_to_cart             - The customer adds a product to their cart by providing their user ID and the product's SKU");
    io:println("place_order             - The customer places an order for all products in their cart\n");
}