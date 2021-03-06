var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var hash = require('../helpers/hash');

var User = require('../models/user');

passport.serializeUser(function (user, done) {
  done(null, user.id);
});

passport.deserializeUser(function (id, done) {
  User.findById(id, function (err, user) {
    done(err, user);
  });
});

passport.use('local.signin', new LocalStrategy(
  function (username, password, done) {
    User.findOne({
      username: username
    }, function (err, user) {
      if (err)
        return done(err);
      if (!user)
        return done(null, false, {
          message: 'User not found'
        });
      else {
        if (hash.compare(password, user.password))
          return done(null, user);
        else
          return done(null, false, {
            message: 'Incorrect password',
          });
      }
    });
  }
));