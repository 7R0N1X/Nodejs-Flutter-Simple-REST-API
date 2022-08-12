const mongoose = require('mongoose');

async function connect() {
    await mongoose.connect('mongodb://localhost/users', {
        useNewUrlParser: true
    });
    console.log('====================================');
    console.log('Database: Connected');
    console.log('====================================');
}

module.exports = { connect };