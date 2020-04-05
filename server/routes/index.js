var express = require('express');
var router = express.Router();
var passport = require('passport');

var hash = require('../helpers/hash');
var User = require('../models/user').User;

/* GET home page. */
router.get('/', function (req, res, next) {
  res.send({
    message: 'Hello World'
  });
});

router.post('/signup', function (req, res, next) {
  if (req.body.username && req.body.password) {
    let {
      username,
      password
    } = req.body;
    password = hash.hash(password);

    let newUser = new User({
      username,
      password,
      role: 'subscriber'
    });

    newUser.save((err, user) => {
      if (err)
        return res.sendStatus(500).send(err);

      req.logIn(user, (err) => {
        if (err) throw err;

        console.log('User signed up: ', user);
      });

      res.send({
        status: 'success',
        user
      });
    });
  } else {
    res.send({
      message: 'Missing credential'
    });
  }
});

router.all('/authenticate', function (req, res, next) {
  if (req.user)
    return res.send({
      auth: false,
      message: 'Already signed in',
      user: req.user
    });
  passport.authenticate('local.signin', function (err, user, info) {
    if (err) return next(err);
    if (!user) return next(info);

    req.logIn(user, function (err) {
      if (err) return next(err);

      res.json({
        auth: true,
        user,
        session: req.sessionID
      });
    });

  })(req, res, next);
}, function (err, req, res) {
  res.status(403).send({
    error: 'auth/failure',
    message: 'The given username and password don\'t correspond'
  });
});

router.get('/logout', function (req, res, next) {
  if (req.user) {
    req.logOut();
    return res.send({
      status: 'success'
    });
  }

  res.status(400).send({
    status: 'failure'
  });
});

module.exports = router;