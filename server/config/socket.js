var OptimizedMap = require("../classes/map");

/**
 * Initialize SocketIO server
 * @param {SocketIO.Server} io The socket server
 */
function initSocket(io) {
  const currentConnections = new OptimizedMap();

  io.on("connection", function (socket) {
    currentConnections.set(socket, {});

    io.emit("user-connected", currentConnections.size);

    socket.on("user-data", function (data) {
      currentConnections.set(socket, data);
    });

    socket.on("send-message", function (data) {
      if (typeof data.targetId === "string")
        socket.broadcast.to(data.targetId).emit("message", data.message);
    });

    socket.on("disconnect", function () {
      currentConnections.delete(socket);
    });
  });
}

module.exports = initSocket;