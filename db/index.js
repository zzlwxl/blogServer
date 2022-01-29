const mysql = require('mysql')
const db = mysql.createPool({
    host:'124.223.112.173',
    user:'testDB',
    password:'zzlzzl666...',
    database:'testdb'
})
module.exports=db