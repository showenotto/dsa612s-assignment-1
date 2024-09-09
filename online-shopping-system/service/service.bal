import ballerina/grpc;

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {descriptor: ONLINE_SHOPPING_SYSTEM_DESC}
service "OnlineShoppingSystem" on ep {

    remote function add_product(product value) returns int|error {
    }

    remote function create_users(createUserRequest value) returns createUserResponse|error {
    }

    remote function update_product(product value) returns product|error {
    }

    remote function remove_product(int value) returns product|error {
    }

    remote function search_product(string value) returns product|error {
    }

    remote function list_available_product() returns stream<product, error?>|error {
    }
}

