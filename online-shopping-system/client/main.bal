import ballerina/io;

OnlineShoppingSystemClient ep = check new ("http://localhost:9090");

public function main() returns error? {
    product add_productRequest = {sku: "ballerina", code: 1, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
    int add_productResponse = check ep->add_product(add_productRequest);
    io:println(add_productResponse);

    createUserRequest create_usersRequest = {isAdmin: true, username: "ballerina", firstName: "ballerina", lastName: "ballerina", password: "ballerina"};
    createUserResponse create_usersResponse = check ep->create_users(create_usersRequest);
    io:println(create_usersResponse);

    product update_productRequest = {sku: "ballerina", code: 1, name: "ballerina", price: "ballerina", status: "ballerina", description: "ballerina", stock_quantity: 1};
    product update_productResponse = check ep->update_product(update_productRequest);
    io:println(update_productResponse);

    int remove_productRequest = 1;
    product remove_productResponse = check ep->remove_product(remove_productRequest);
    io:println(remove_productResponse);

    string search_productRequest = "ballerina";
    product search_productResponse = check ep->search_product(search_productRequest);
    io:println(search_productResponse);
    stream<

product, error?> list_available_productResponse = check ep->list_available_product();
    check list_available_productResponse.forEach(function(product value) {
        io:println(value);
    });
}

