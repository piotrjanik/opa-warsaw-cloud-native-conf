import {Request, ResponseToolkit, ServerRoute} from "hapi";
import {post, Response} from 'superagent';
import Logger = require("bunyan");

export namespace Api {

    export function getRoutes(name: string, logger: Logger): ServerRoute[] {
        return [
            {
                method: "GET",
                path: `/api/mushrooms`,
                handler: (request: Request, h: ResponseToolkit) => {
                    const color = request.query['color'] ? request.query['color'] : null;
                    return checkOpa(logger, request.headers['authorization'], 'mushrooms', 'Get', color)
                        .then(allow => {
                            if (!allow) {
                                return h.response('not allowed').code(403);
                            } else {
                                return h.response('ok').code(200);

                            }
                        });
                }
            },
            {
                method: "POST",
                path: `/api/mushrooms`,
                handler: (request: Request, h: ResponseToolkit) => {
                    const color = request.query['color'] ? request.query['color'] : null;
                    return checkOpa(logger, request.headers['authorization'], 'mushrooms', 'Get', color)
                        .then(allow => {
                            if (!allow) {
                                return h.response().code(403);
                            } else {
                                return h.response().code(201);

                            }
                        });
                }
            }
        ];
    }


    const checkOpa = (logger, token: string, serviceName: string, action: string, color: string | string[] | null) => {
        const input = {
            "input": {
                "principal": token,
                "action": action,
                "resource": {
                    "name": serviceName,
                    "color": color
                }
            }
        };
        logger.info({input: input}, 'Sent opa input');
        return post('http://localhost:8181/v1/data/demo/allow')
            .send(input)
            .then((response: Response) => {
                logger.error(response.body);
                return response.body.result;
            });
    }

}
