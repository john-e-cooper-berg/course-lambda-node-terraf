
class BmiCalcService {
    constructor(){
        this.performBmiCalculation = (w, h) => {
            if(h == 0){
                throw Error('Height has to be > 0');
            }
            let weight = parseFloat(w);
            let height = parseFloat(h);
            return (weight / height / height * 10000).toFixed(2);
        }
    }
}
exports.BmiCalcService = BmiCalcService;