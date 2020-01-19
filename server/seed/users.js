var mongoose = require('mongoose');
var hash = require('../helpers/hash');

var conf = require('../constants/conf');
var User = require('../models/user');

mongoose.connect(conf.mongodburi, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  autoCreate: true,
});

var danze = new User({
  username: 'danze',
  password: hash.hash('danze')
});

danze.save(function (err) {
  if (err)
    throw err;
});