const mysql = require('mysql')
const {dbPwd,host} = require('../../dbPwd.js')

const db = mysql.createPool({
    host:host,
    user:'testDB',
    password:dbPwd,
    database:'testdb'
})
module.exports=db