/**
 * Initialize SocketIO server
 * @param {SocketIO.Server} io The socket server
 */
function initSocket(io) {
  io.on('connection', function (socket) {
    // TODO
  });
}

module.exports = initSocket;