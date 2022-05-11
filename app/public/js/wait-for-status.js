// Dummy script that connects to server and waits for answer with status
// Base for future work with WebSocket

host = window.location.hostname
port = window.location.port

const socket = new WebSocket('ws://' + host + ':' + port);
const element = document.getElementById('status')


socket.onopen = function () {
    console.log("socket is open")
};

socket.onmessage = function(event) {
   const status = event.data;
   element.querySelector(".status-text").innerText = status;
   const classes = element.classList;
   for (const cl of classes)
   {
       console.log(cl)
        if (cl.includes('status'))
        {
            console.log(cl)
            element.classList.remove(cl);
        }
    }

   element.classList.remove('status-que');
   element.classList.add('status-'+status.toLowerCase())
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