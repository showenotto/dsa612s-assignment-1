import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {descriptor: ONLINE_SHOPPING_SYSTEM_DESC}
service "OnlineShoppingSystem" on ep {
    private map<Product> products = {};
    private map<Cart> carts = {};
    private map<User> users = {};
    private int code = 0;

    remote function add_product(Product value) returns int|error {
        int new_code = self.code + 1;
        Product product ={sku:value.sku, code:new_code, name:value.name, price:value.price, status:value.status, description:value.description, stock_quantity:value.stock_quantity};
        lock {
            if self.products.hasKey(value.name.clone()){
                string err = "Product with SKU '" + value.name.clone() + "' already exists";
                return error(err);
            }
            else{
                self.products[value.sku.clone()] = product.clone();
                return value.code;
            }
        }
    }

    remote function list_users(Void value) returns Users|error {
        Users u = {};
        return u;
    }

    remote function update_product(Product value) returns Product|error {
        Product u = {};
        return u;
    }

    remote function remove_product(int value) returns Products|error {
        Products u = {};
        return u;
    }

    remote function list_available_product() returns Products|error {
        Products u = {};
        return u;
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

    remote function create_users(stream<User, grpc:Error?> clientStream) returns User|error {
        User u = {};
        return u;
    }
}

