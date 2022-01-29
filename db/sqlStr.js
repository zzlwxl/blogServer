//用户注册
exports.sqlReguser=`select * from ev_users where username=?`
//用户登录
exports.sqlLogin=`select * from ev_users where username=?`
//获取用户基本信息
exports.sqlUserInfo = `select id, username, nickname, email, user_pic from ev_users where id=?`
//更新用户基本信息
exports.sqlUpdateUserInfo = `update ev_users set ? where id=?`
//更新用户秘密_查询用户信息
exports.sqlUpdatePwdSelect = `select * from ev_users where id=?`
//更新用户密码
exports.sqlUpdatePwd = `update ev_users set password=? where id=?`
//更新用户头像
exports.sqlUpdateUserImg = `update ev_users set user_pic=? where id=?`