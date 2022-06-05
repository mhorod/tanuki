import { IRouter } from "../deps.ts"
function setUpWebsocket(router: IRouter) {
    router.get("/ws", (req, res, next) => {
        if (req.headers.get('upgrade') == 'websocket') {
            console.log("Hello websocket!")
            const socket = req.upgrade();

            const ok = Math.random() < 0.3;
            setTimeout(
                () => {
                    if (socket.readyState == socket.OPEN)
                        socket.send(ok ? 'OK' : 'ANS')


                    setTimeout(() => {
                        if (socket.readyState == socket.OPEN)
                            socket.send('REJ');
                        socket.close()
                    }, 1000)
                },
                2000
            )
        }
    });

}