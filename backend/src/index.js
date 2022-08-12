const app = require('./app');

async function main() {
    await app.listen(4000);
    console.log('====================================');
    console.log('Server on port 4000');
    console.log('====================================');
}

main();