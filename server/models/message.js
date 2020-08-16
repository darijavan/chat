var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var messageSchema = new Schema({
  date: {
    type: Date,
    required: true,
    default: Date.now
  },
  content: {
    type: String,
    required: true
  },
  sender: {
    type: String,
    require: true
  }
});

exports.messageSchema = messageSchema;
exports.Message = mongoose.model('Message', messageSchema);