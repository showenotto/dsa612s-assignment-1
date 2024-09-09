import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string ONLINE_SHOPPING_SYSTEM_DESC="0A1C6F6E6C696E652D73686F7070696E672D73797374656D2E70726F746F12166F6E6C696E655F73686F7070696E675F73797374656D1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F22BA010A0750726F6475637412100A03736B751801200128095203736B7512120A04636F64651802200128055204636F646512120A046E616D6518032001280952046E616D6512140A0570726963651804200128095205707269636512160A06737461747573180520012809520673746174757312200A0B6465736372697074696F6E180620012809520B6465736372697074696F6E12250A0E73746F636B5F7175616E74697479180720012805520D73746F636B5175616E7469747922430A0443617274123B0A0870726F647563747318012003280B321F2E6F6E6C696E655F73686F7070696E675F73797374656D2E50726F64756374520870726F64756374732292010A045573657212180A07697341646D696E1801200128085207697341646D696E121A0A08757365726E616D651802200128095208757365726E616D65121C0A0966697273744E616D65180320012809520966697273744E616D65121A0A086C6173744E616D6518042001280952086C6173744E616D65121A0A0870617373776F7264180520012809520870617373776F726432F3030A144F6E6C696E6553686F7070696E6753797374656D124B0A0B6164645F70726F64756374121F2E6F6E6C696E655F73686F7070696E675F73797374656D2E50726F647563741A1B2E676F6F676C652E70726F746F6275662E496E74333256616C7565124C0A0C6372656174655F7573657273121C2E6F6E6C696E655F73686F7070696E675F73797374656D2E557365721A1C2E6F6E6C696E655F73686F7070696E675F73797374656D2E55736572280112520A0E7570646174655F70726F64756374121F2E6F6E6C696E655F73686F7070696E675F73797374656D2E50726F647563741A1F2E6F6E6C696E655F73686F7070696E675F73797374656D2E50726F64756374124B0A0E72656D6F76655F70726F64756374121B2E676F6F676C652E70726F746F6275662E496E74333256616C75651A1C2E6F6E6C696E655F73686F7070696E675F73797374656D2E43617274124E0A166C6973745F617661696C61626C655F70726F6475637412162E676F6F676C652E70726F746F6275662E456D7074791A1C2E6F6E6C696E655F73686F7070696E675F73797374656D2E43617274124F0A0E7365617263685F70726F64756374121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1F2E6F6E6C696E655F73686F7070696E675F73797374656D2E50726F64756374620670726F746F33";

public isolated client class OnlineShoppingSystemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ONLINE_SHOPPING_SYSTEM_DESC);
    }

    isolated remote function add_product(Product|ContextProduct req) returns int|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/add_product", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <int>result;
    }

    isolated remote function add_productContext(Product|ContextProduct req) returns wrappers:ContextInt|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/add_product", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <int>result, headers: respHeaders};
    }

    isolated remote function update_product(Product|ContextProduct req) returns Product|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/update_product", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Product>result;
    }

    isolated remote function update_productContext(Product|ContextProduct req) returns ContextProduct|grpc:Error {
        map<string|string[]> headers = {};
        Product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/update_product", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Product>result, headers: respHeaders};
    }

    isolated remote function remove_product(int|wrappers:ContextInt req) returns Cart|grpc:Error {
        map<string|string[]> headers = {};
        int message;
        if req is wrappers:ContextInt {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/remove_product", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Cart>result;
    }

    isolated remote function remove_productContext(int|wrappers:ContextInt req) returns ContextCart|grpc:Error {
        map<string|string[]> headers = {};
        int message;
        if req is wrappers:ContextInt {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/remove_product", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Cart>result, headers: respHeaders};
    }

    isolated remote function list_available_product() returns Cart|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/list_available_product", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Cart>result;
    }

    isolated remote function list_available_productContext() returns ContextCart|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/list_available_product", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Cart>result, headers: respHeaders};
    }

    isolated remote function search_product(string|wrappers:ContextString req) returns Product|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/search_product", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <Product>result;
    }

    isolated remote function search_productContext(string|wrappers:ContextString req) returns ContextProduct|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/search_product", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <Product>result, headers: respHeaders};
    }

    isolated remote function create_users() returns Create_usersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeClientStreaming("online_shopping_system.OnlineShoppingSystem/create_users");
        return new Create_usersStreamingClient(sClient);
    }
}

public isolated client class Create_usersStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendUser(User message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextUser(ContextUser message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveUser() returns User|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <User>payload;
        }
    }

    isolated remote function receiveContextUser() returns ContextUser|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <User>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public type ContextUserStream record {|
    stream<User, error?> content;
    map<string|string[]> headers;
|};

public type ContextUser record {|
    User content;
    map<string|string[]> headers;
|};

public type ContextProduct record {|
    Product content;
    map<string|string[]> headers;
|};

public type ContextCart record {|
    Cart content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type User record {|
    boolean isAdmin = false;
    string username = "";
    string firstName = "";
    string lastName = "";
    string password = "";
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type Product record {|
    string sku = "";
    int code = 0;
    string name = "";
    string price = "";
    string status = "";
    string description = "";
    int stock_quantity = 0;
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type Cart record {|
    Product[] products = [];
|};

