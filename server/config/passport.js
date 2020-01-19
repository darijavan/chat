var passport = require('passport');
var LocalStrategy = require('passport-local').Strategy;
var hash = require('../helpers/hash');

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
                // var user = {
                //     username: 'danze',
                //     password: hash.hash('danze'),
                //     id:'1sdf12664wea'

                // }
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