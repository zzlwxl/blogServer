//用户注册
exports.sqlReguser=`select * from ev_users where username=?`
//用户登录
exports.sqlLogin=`select * from ev_users where username=?`