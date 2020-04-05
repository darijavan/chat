var express = require('express');
var router = express.Router();

var User = require('../models/user').User;

/* GET users listing. */
router.get('/:userId', function (req, res, next) {
  res.send(req.params);
});

router.get('/', function (req, res, next) {
  if (req.user && req.user.role === 'admin')
    return User.find().then(users => res.send(users));

  if (!req.user)
    return res.status(401).send({
      error: 'auth/not-authenticated',
      message: 'You are not authenticated'
    });

  res.status(403).send({
    error: 'auth/not-enough-permission',
    message: 'You have not enought permission to access this endpoint'
  });
});

router.get('/me', function (req, res, next) {
  if (req.user)
    return res.send(req.user);

  res.send({
    message: 'Not authenticated'
  });
});

module.exports = router;