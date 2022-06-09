import { IRouter } from "../deps.ts"
import { Checker } from "./checker.ts"

interface WebsocketConfig {
    checker: Checker,
}

export default function (router: IRouter, config: WebsocketConfig) {
    router.get("/ws/submit/:submit_id", (req, res, next) => {
        if (req.headers.get('upgrade') == 'websocket') {
            const socket = req.upgrade();
            const submit_id = parseInt(req.params.submit_id);
            config.checker.listen(submit_id, (status: any) => {
                if (socket.readyState == socket.OPEN) {
                    socket.send(status);
                    socket.close();
                }
            }
            )

        }
    });

}