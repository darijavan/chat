var express = require('express');
var router = express.Router();
var hash = require('../helpers/hash');
var User = require('../models/user');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
});

router.post('/authenticate', function (req, res) {
  var username = req.body.username;
  var password = req.body.password;
  User.findOne({
    username: username
  }, function (err, user) {
    if (err)
      return res.sendStatus(500);
    if (!user)
      return res.json({
        message: 'User not found',
      });
    else {
      if (hash.compare(password, user.password))
        return res.json({
          message: 'OK',
        });
      else
        return res.json({
          message: 'Incorrect password',
        });
    }
  });
});

module.exports = router;