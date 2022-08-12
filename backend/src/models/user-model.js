const { Schema, model } = require('mongoose');

const userSchema = new Schema({
    firstName: String,
    lastName: String,
    phoneNumber: String
});

module.exports = model('user', userSchema);