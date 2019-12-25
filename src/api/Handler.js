const Result = require('./Result');

class Handler {
    constructor(bmiCalcService){
        this.handleCalculation = async (event, context, callback) => {
            try {
                let weight = event.queryStringParameters.weight;
                let height = event.queryStringParameters.height;
                if (isNaN(weight) || isNaN(height)) {
                    return new Result.BadRequest_400('Weight or height is not a number');
                }
                let bmiResult = await this.bmiCalcService.performBmiCalculation(weight, height);
                return new Result.OK_200(bmiResult);
            }catch (e) {
                return new Result.InternalServerError_500(e);
            }
        };
        this.bmiCalcService = bmiCalcService;
    }
}
exports.Handler = Handler;