"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.handler = void 0;
const AWS = __importStar(require("aws-sdk"));
const knex_1 = __importDefault(require("knex"));
AWS.config.update({ region: 'eu-central-1' });
const host = 'rds-cluster-proxy.proxy-cxzadf8nmshb.eu-central-1.rds.amazonaws.com';
const user = 'admin';
const password = 'password';
const database = 'mydatabase';
const port = '3306';
const connection = {
    ssl: { rejectUnauthorized: false },
    host,
    user,
    password,
    database,
    port,
};
// create a connection 
const knex = (0, knex_1.default)({
    client: 'mysql',
    connection,
});
let count = 0;
const handler = function (event, context) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            // use the connection to execute queries
            count++;
            yield knex('my_table').insert({
                name: `execution #${count}`,
            });
            const res = yield knex('my_table').select();
            console.log(res);
            // If you want to return the results to the caller:
            // return res;
        }
        catch (err) {
            console.error(err);
            let errorMessage = "An error occurred";
            if (err instanceof Error) {
                errorMessage = err.message;
            }
            // If this is an API Gateway Lambda function and you want to return the error:
            // return {
            //   statusCode: 500,
            //   body: JSON.stringify({ error: errorMessage })
            // };
            // If you're not returning the error to the caller, you can just log it:
            console.log({ error: errorMessage });
        }
    });
};
exports.handler = handler;
