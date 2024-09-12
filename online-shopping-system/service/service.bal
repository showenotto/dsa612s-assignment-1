import ballerina/grpc;
import ballerina/io;

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {descriptor: ONLINE_SHOPPING_SYSTEM_DESC}
service "OnlineShoppingSystem" on ep {
    private map<Product> products = {};
    private map<Cart> carts = {};
    private map<User> users = {};
    private int code = -1;
    private int id = -1;
    //Admin
    private User admin = {firstName: "Showen", lastName: "Otto", username: "sotto", password: "password", isAdmin:true};

    public function init() {
        self.users[self.admin.username] = self.admin;
        io:println("Initializing...");
    }
    remote function add_product(Product value) returns int|error {
        int new_code = self.code + 1;
        Product product ={sku:value.sku, code:new_code, name:value.name, price:value.price, status:value.status, description:value.description, stock_quantity:value.stock_quantity};
        lock {
            if self.products.hasKey(value.name.clone()){
                string err = "Product with name '" + value.name.clone() + "' already exists!";
                return error(err);
            }
            else{
                self.products[value.name.clone()] = product.clone();
                return value.code;
            }
        }
    }

    remote function list_users(Void value) returns Users|error {
        User[] userList = [];
        lock {
            foreach [string, User] [user, User] in self.users.entries(){
                userList.push(User);
            }
        }
        Users users = {users: userList};
        return users;
    }

    remote function update_product(Product value) returns Product|error {
        Product product ={sku:value.sku, code: value.code, name:value.name, price:value.price, status:value.status, description:value.description, stock_quantity:value.stock_quantity};
        lock {
            if self.products.hasKey(value.name.clone()){
                self.products[value.name.clone()] = product.clone();
            }
            else{
                string err = "Product with name '" + value.name.clone() + "' does not exist!";
                return error(err);
            }
        }
        Product u = {};
        return u;
    }

    remote function remove_product(int value) returns Products|error {
        Products u = {};
        return u;
    }

    remote function list_available_product() returns Products|error {
        Product[] productList = [];
        lock {
            foreach [string, Product] [product, Product] in self.products.entries(){
                productList.push(Product);
            }
        }
        Products products = {products: productList};
        return products;
    }
    remote function search_product(string value) returns Product|error {
        Product u = {};
        return u;
    }

    remote function add_to_cart(Cart value) returns int|error {
        return 1;
    }

    remote function place_order(int value) returns Products|error {
        Products u = {};
        return u;
    }

    remote function create_users(stream<User, grpc:Error?> clientStream) returns error? {
        int new_id = self.id + 1;
        error? e = clientStream.forEach(function(User user){
            if self.users.hasKey(user.username.clone()){
                string err = "A user with username ${users.username} already exists!";
                io:println(err);
            }
            user.id = new_id;
            self.users[user.username.clone()] = user.clone(); 
        });
        return e;
    }
    //Additional functions
    remote function login(Login login) returns User|error{
        if self.users.hasKey(login.username){
            User? user = self.users[login.username];
            
            if user?.password == login.password{
                return user ?: {};
            }
            else{
                return error("Invalid credentials!");
            }
        }
        else{
            return error("User not found!");
        }
    } 
}

