const Handler = require('./api/Handler').Handler;
const BmiCalcService = require('./service/BmiCalcService').BmiCalcService;
const handler = new Handler(new BmiCalcService());

exports.performBmiCalculation = handler.handleCalculation;