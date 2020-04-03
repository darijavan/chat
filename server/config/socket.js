import {
  Server
} from "socket.io";

/**
 * Initialize SocketIO server
 * @param {Server} io The socket server
 */
function initSocket(io) {
  io.on('connection', function (socket) {
    // TODO
  });
}

export default initSocket;