var bcrypt = require('bcrypt');

module.exports = {
  compare: function (data, encrypted) {
    return bcrypt.compareSync(data, encrypted);
  },

  hash: function (data) {
    return bcrypt.hashSync(data, bcrypt.genSaltSync(5), null);
  }
}