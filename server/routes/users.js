var express = require('express');
var router = express.Router();
var passport = require('passport');

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send({
    message: 'respond with a resource'
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