const logger = require('../logger/Logger').Logger;

class BmiCalcService {
    constructor(){
        this.performBmiCalculation = (w, h) => {
            logger.info(`BmiCalcService#performBmiCalculation: w=${w}, h=${h}`);
            if(h == 0){
                throw Error('Height has to be > 0');
            }
            let weight = parseFloat(w);
            let height = parseFloat(h);
            logger.info(`BmiCalcService#performBmiCalculation: weight=${weight}, height=${height}`);
            return (weight / height / height * 10000).toFixed(2);
        }
    }
}
exports.BmiCalcService = BmiCalcService;