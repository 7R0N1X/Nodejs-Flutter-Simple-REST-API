const { Router } = require('express');
const router = Router();
const userModel = require('../models/user-model');
const faker = require('faker');

router.get('/api/users', async (req, res) => {
    const userList = await userModel.find();
    res.json({userList});
});

router.get('/api/users/create', async (req, res) => {
    for (let i = 0; i < 5; i++) {
        await userModel.create({
            firstName: faker.name.firstName(),
            lastName: faker.name.lastName(),
            phoneNumber: faker.phone.phoneNumber('+593 ## ### ####')
        })
    }
    res.json({ message: '5 users created' })
});

module.exports = router;