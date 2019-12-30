const winston = require('winston');
const { uuid } = require('uuidv4');

const logger = winston.createLogger({
   level: 'info',
   format: winston.format.json(),
   defaultMeta: { service: 'bmi', correlationId: uuid()},
   transports: [
       new winston.transports.Console({
           format: winston.format.simple()
       })
   ]
});

exports.Logger = logger;