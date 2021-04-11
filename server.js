const fs = require('fs-extra')

const packageObj = await fs.readJson('data/Questions-test.json')
console.log(packageObj.version)