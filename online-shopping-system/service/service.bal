import ballerina/io;
import ballerina/grpc;
import ballerina/protobuf.types.wrappers;

listener grpc:Listener ep = new (9090);

@grpc:ServiceDescriptor {descriptor: ONLINE_SHOPPING_SYSTEM_DESC}
service "OnlineShoppingSystem" on ep {

    remote function add_product(wrappers:ContextString request, Product value) returns int|error {
        string AUTH_HEADER = check grpc:getHeader(request.headers, "Authorization");
        io:println(AUTH_HEADER);
        return 1;
    }

    remote function update_product(Product value) returns Product|error {
    }

    remote function remove_product(int value) returns Cart|error {
    }

    remote function list_available_product() returns Cart|error {
    }

    remote function search_product(string value) returns Product|error {
    }

    remote function create_users(stream<User, grpc:Error?> clientStream) returns User|error {
    }
}

