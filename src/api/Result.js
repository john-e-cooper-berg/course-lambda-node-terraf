const headers = {'Content-type': 'application/json'};

class OK_200 {
    constructor(message){
        this.statusCode = 200;
        this.headers = headers;
        this.body = JSON.stringify({"result": message});
        this.isBase64Encoded = false;
    }
}

class BadRequest_400 {
    constructor(message){
        this.statusCode = 400;
        this.headers = headers;
        this.body = JSON.stringify({"error": message});
        this.isBase64Encoded = false;
    }
}

class InternalServerError_500 {
    constructor(e){
        this.statusCode = 500;
        this.headers = headers;
        this.body = JSON.stringify({"error": e.message});
        this.isBase64Encoded = false;
    }
}

exports.OK_200 = OK_200;
exports.BadRequest_400 = BadRequest_400;
exports.InternalServerError_500 = InternalServerError_500;