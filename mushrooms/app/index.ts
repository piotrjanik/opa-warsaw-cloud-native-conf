import * as Hapi from "hapi";
import * as yargs from "yargs";
import {Api} from "./api";
import * as Logger from "bunyan";

const argv: yargs.Arguments = yargs
    .env()
    .option("n", {
        alias: "name",
        default: "mushrooms",
        describe: "Service name"
    })
    .option("p", {
        alias: "port",
        default: 8080,
        describe: "Port app should listen on"
    })
    .option("a", {
        alias: "addr",
        default: "0.0.0.0",
        describe: "IP address app should bind"
    })
    .option("L", {
        describe: "Log level to use by app",
        alias: "logLevel",
        default: "info",
        choices: ["trace", "info", "debug", "error", "fatal"]
    })
    .help("usage", "How to use it").argv;

let logger: Logger = Logger.createLogger({
    name: (argv["name"] as string),
    level: Logger.levelFromName[String(argv.logLevel)]
});

const init = async () => {
    const server = new Hapi.Server({
        port: String(argv["port"]),
        host: String(argv["addr"])
    });
    await server.register({
        plugin: require("hapi-alive"),
        options: {
            path: "/health", //Health route path
            tags: ["health", "monitor"],
            healthCheck: server => {
                //Here could be more complex healthchecks
                return true;
            }
        }
    });
    server.route(Api.getRoutes(String(argv["name"]),logger));
    await server.start();
    logger.info(`Server running at: ${server.info.uri}`);
};

// @ts-ignore
process.on('unhandledRejection', (reason: Error) => {
    logger.error(reason);
    process.exit(1);
});

init();
