var express = require('express');
var router = express.Router();

router.post('/', function (req, res) {
  var user = req.user;
  if (!user)
    return res.sendStatus(403);
  res.send(user);
});

module.exports = router;