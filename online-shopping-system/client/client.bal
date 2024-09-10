import ballerina/io;

OnlineShoppingSystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    Product add_productRequest = {sku: "ballerina", code: 1, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
    int add_productResponse = check ep->add_product(add_productRequest);
    io:println(add_productResponse);

    Void list_usersRequest = {};
    Users list_usersResponse = check ep->list_users(list_usersRequest);
    io:println(list_usersResponse);

    Product update_productRequest = {sku: "ballerina", code: 1, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
    Product update_productResponse = check ep->update_product(update_productRequest);
    io:println(update_productResponse);

    int remove_productRequest = 1;
    Products remove_productResponse = check ep->remove_product(remove_productRequest);
    io:println(remove_productResponse);

    Products list_available_productResponse = check ep->list_available_product();
    io:println(list_available_productResponse);

    string search_productRequest = "ballerina";
    Product search_productResponse = check ep->search_product(search_productRequest);
    io:println(search_productResponse);

    Cart add_to_cartRequest = {userId: "ballerina", sku: "ballerina"};
    int add_to_cartResponse = check ep->add_to_cart(add_to_cartRequest);
    io:println(add_to_cartResponse);

    int place_orderRequest = 1;
    Products place_orderResponse = check ep->place_order(place_orderRequest);
    io:println(place_orderResponse);

    User create_usersRequest = {id: "ballerina", isAdmin: true, username: "ballerina", firstName: "ballerina", lastName: "ballerina", password: "ballerina"};
    Create_usersStreamingClient create_usersStreamingClient = check ep->create_users();
    check create_usersStreamingClient->sendUser(create_usersRequest);
    check create_usersStreamingClient->complete();
    User? create_usersResponse = check create_usersStreamingClient->receiveUser();
    io:println(create_usersResponse);
}

