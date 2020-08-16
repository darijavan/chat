var createError = require("http-errors");
var express = require("express");
var path = require("path");
var cookieParser = require("cookie-parser");
var logger = require("morgan");
var session = require("express-session");
var mongoose = require("mongoose");
var MongoStore = require("connect-mongo")(session);
var passport = require("passport");

var conf = require("./constants/conf");

var indexRouter = require("./routes/index");
var usersRouter = require("./routes/users");
var messagesRouter = require("./routes/messages");

var app = express();

// connection to the mongoDB server
mongoose.connect(conf.mongodburi, {
  useNewUrlParser: true,
  useUnifiedTopology: true,
  autoCreate: true,
});

// load passport configurations
require("./config/passport");

app.use(logger("dev"));
app.use(express.json());
app.use(
  express.urlencoded({
    extended: false,
  })
);
app.use(cookieParser());

// inialize session
app.use(
  session({
    secret: conf.sessionSecretKey,
    resave: false,
    saveUninitialized: false,
    store: new MongoStore({
      mongooseConnection: mongoose.connection,
      autoRemove: "native",
    }),
    cookie: {
      maxAge: 60 * 60 * 1000,
      secure: true,
    },
  })
);

// initialize passport
app.use(passport.initialize());
app.use(passport.session());

app.use(express.static(path.join(__dirname, "public")));

app.use("/", indexRouter);
app.use("/api", indexRouter);
app.use("/api/users", usersRouter);
app.use("/messages", messagesRouter);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404));
});

// error handler
app.use(function (err, req, res, next) {
  // only providing error in development
  const message = err.message,
    error = req.app.get("env") === "development" ? err : {};

  // send the error to client
  res.status(err.status || 500);
  res.send({
    message,
    error,
  });
});

module.exports = app;
