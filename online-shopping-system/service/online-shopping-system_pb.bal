import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string ONLINE_SHOPPING_SYSTEM_DESC="0A1C6F6E6C696E652D73686F7070696E672D73797374656D2E70726F746F12166F6E6C696E655F73686F7070696E675F73797374656D1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F22BA010A0770726F6475637412100A03736B751801200128095203736B7512120A04636F64651802200128055204636F646512120A046E616D6518032001280952046E616D6512140A0570726963651804200128095205707269636512160A06737461747573180520012809520673746174757312200A0B6465736372697074696F6E180620012809520B6465736372697074696F6E12250A0E73746F636B5F7175616E74697479180720012805520D73746F636B5175616E7469747922430A0463617274123B0A0870726F647563747318012003280B321F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F64756374520870726F6475637473229F010A11637265617465557365725265717565737412180A07697341646D696E1801200128085207697341646D696E121A0A08757365726E616D651802200128095208757365726E616D65121C0A0966697273744E616D65180320012809520966697273744E616D65121A0A086C6173744E616D6518042001280952086C6173744E616D65121A0A0870617373776F7264180520012809520870617373776F7264224A0A1263726561746555736572526573706F6E7365121A0A08757365726E616D651801200128095208757365726E616D6512180A07697341646D696E1802200128085207697341646D696E3294040A144F6E6C696E6553686F7070696E6753797374656D124B0A0B6164645F70726F64756374121F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F647563741A1B2E676F6F676C652E70726F746F6275662E496E74333256616C756512650A0C6372656174655F757365727312292E6F6E6C696E655F73686F7070696E675F73797374656D2E63726561746555736572526571756573741A2A2E6F6E6C696E655F73686F7070696E675F73797374656D2E63726561746555736572526573706F6E736512520A0E7570646174655F70726F64756374121F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F647563741A1F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F64756374124E0A0E72656D6F76655F70726F64756374121B2E676F6F676C652E70726F746F6275662E496E74333256616C75651A1F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F6475637412530A166C6973745F617661696C61626C655F70726F6475637412162E676F6F676C652E70726F746F6275662E456D7074791A1F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F647563743001124F0A0E7365617263685F70726F64756374121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1F2E6F6E6C696E655F73686F7070696E675F73797374656D2E70726F64756374620670726F746F33";

public isolated client class OnlineShoppingSystemClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ONLINE_SHOPPING_SYSTEM_DESC);
    }

    isolated remote function add_product(product|ContextProduct req) returns int|grpc:Error {
        map<string|string[]> headers = {};
        product message;
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

    isolated remote function add_productContext(product|ContextProduct req) returns wrappers:ContextInt|grpc:Error {
        map<string|string[]> headers = {};
        product message;
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

    isolated remote function create_users(createUserRequest|ContextCreateUserRequest req) returns createUserResponse|grpc:Error {
        map<string|string[]> headers = {};
        createUserRequest message;
        if req is ContextCreateUserRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/create_users", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <createUserResponse>result;
    }

    isolated remote function create_usersContext(createUserRequest|ContextCreateUserRequest req) returns ContextCreateUserResponse|grpc:Error {
        map<string|string[]> headers = {};
        createUserRequest message;
        if req is ContextCreateUserRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/create_users", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <createUserResponse>result, headers: respHeaders};
    }

    isolated remote function update_product(product|ContextProduct req) returns product|grpc:Error {
        map<string|string[]> headers = {};
        product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/update_product", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <product>result;
    }

    isolated remote function update_productContext(product|ContextProduct req) returns ContextProduct|grpc:Error {
        map<string|string[]> headers = {};
        product message;
        if req is ContextProduct {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("online_shopping_system.OnlineShoppingSystem/update_product", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <product>result, headers: respHeaders};
    }

    isolated remote function remove_product(int|wrappers:ContextInt req) returns product|grpc:Error {
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
        return <product>result;
    }

    isolated remote function remove_productContext(int|wrappers:ContextInt req) returns ContextProduct|grpc:Error {
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
        return {content: <product>result, headers: respHeaders};
    }

    isolated remote function search_product(string|wrappers:ContextString req) returns product|grpc:Error {
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
        return <product>result;
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
        return {content: <product>result, headers: respHeaders};
    }

    isolated remote function list_available_product() returns stream<product, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("online_shopping_system.OnlineShoppingSystem/list_available_product", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        ProductStream outputStream = new ProductStream(result);
        return new stream<product, grpc:Error?>(outputStream);
    }

    isolated remote function list_available_productContext() returns ContextProductStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("online_shopping_system.OnlineShoppingSystem/list_available_product", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        ProductStream outputStream = new ProductStream(result);
        return {content: new stream<product, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class ProductStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|product value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if streamValue is () {
            return streamValue;
        } else if streamValue is grpc:Error {
            return streamValue;
        } else {
            record {|product value;|} nextRecord = {value: <product>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public isolated client class OnlineShoppingSystemProductCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendProduct(product response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextProduct(ContextProduct response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class OnlineShoppingSystemCreateUserResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateUserResponse(createUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateUserResponse(ContextCreateUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class OnlineShoppingSystemIntCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendInt(int response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextInt(wrappers:ContextInt response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextProductStream record {|
    stream<product, error?> content;
    map<string|string[]> headers;
|};

public type ContextProduct record {|
    product content;
    map<string|string[]> headers;
|};

public type ContextCreateUserResponse record {|
    createUserResponse content;
    map<string|string[]> headers;
|};

public type ContextCreateUserRequest record {|
    createUserRequest content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type product record {|
    string sku = "";
    int code = 0;
    string name = "";
    string price = "";
    string status = "";
    string description = "";
    int stock_quantity = 0;
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type createUserResponse record {|
    string username = "";
    boolean isAdmin = false;
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type createUserRequest record {|
    boolean isAdmin = false;
    string username = "";
    string firstName = "";
    string lastName = "";
    string password = "";
|};

@protobuf:Descriptor {value: ONLINE_SHOPPING_SYSTEM_DESC}
public type cart record {|
    product[] products = [];
|};

