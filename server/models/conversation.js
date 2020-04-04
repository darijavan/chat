var mongoose = require('mongoose');
var Schema = mongoose.Schema;

var messageSchema = require('./message').messageSchema;

var conversationSchema = new Schema({
  users: [{
    id: String
  }],
  messages: [messageSchema]
});

exports.conversationSchema = conversationSchema;
exports.Conversation = mongoose.model('Conversation', conversationSchema);