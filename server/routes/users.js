var express = require('express');
var router = express.Router();
var passport = require('passport');

var hash = require('../helpers/hash');
var User = require('../models/user');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send({
    message: 'respond with a resource'
  });
});

router.post('/logout', function (req, res, next) {
  req.logOut();
  res.redirect('/');
});

router.post('/signup', function (req, res, next) {
  var username = req.body.username,
    password = req.body.password;

  User.findOne({
    username: username,
  }, function (err, user) {
    if (err) return res.sendStatus(500);

    if (user) return res.json({
      status: 'failed',
      message: 'Username already in use'
    });

    var newUser = new User({
      username: username,
      password: hash.hash(password),
    });

    newUser.save(function (err, newUser) {
      if (err) return res.sendStatus(500);

      req.logIn(newUser, function (err) {
        if (err) throw err;

        return res.json({
          status: 'success',
          user: newUser,
          sessionToken: req.sessionID,
        });
      });
    });
  });
});

router.post('/authenticate', function (req, res, next) {
  passport.authenticate('local.signin', function (err, user, info) {
    if (err) return next(err);
    if (!user) return next(info);

    req.logIn(user, function (err) {
      if (err) return next(err);

      res.json(user);
    });

  })(req, res, next);
}, function (err, req, res) {
  res.sendStatus(403);
});

router.get('/log', function (req, res, next) {
  req.logOut();
  res.redirect('/signin');
});

module.exports = router;