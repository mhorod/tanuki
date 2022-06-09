// Dummy script that connects to server and waits for answer with status
// Base for future work with WebSocket

host = window.location.hostname
port = window.location.port
protocol = window.protocol == 'https' ? 'wss' : 'ws';

function newSocket(path) { 
    return new WebSocket(protocol + '://' + host + ':' + port + '/ws/' + path);
}



function waitForStatus(id) {
    const element = document.getElementById('status-' + id)
    const statusElement = element.querySelector(".status-text")
    const socket = newSocket("submit/" + id)
    socket.onopen = function () {
        console.log("socket is open")
    };

    socket.onmessage = function(event) {
        window.location.reload()
    };

    socket.onclose = function(_event) {
        stopLoading();
    };

    socket.onerror = function(_event) {
        stopLoading();
    };

    function stopLoading()
    {
        element.querySelector('.loading').remove()
    }
}