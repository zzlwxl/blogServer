const db = require('../db/index.js')
const bcrypt = require('bcryptjs')
const { sqlUserInfo, sqlUpdateUserInfo, sqlUpdatePwdSelect, sqlUpdatePwd ,sqlUpdateUserImg} = require('../db/sqlStr.js')

//获取用户基本信息
exports.getUserInfo = (req, res) => {
  db.query(sqlUserInfo, [req.user.id], (err, results) => {
    if (err) return res.cc(err)
    //查询结果为空
    if (results.length !== 1) return res.cc('获取用户信息失败')
    res.send({
      status: 0,
      message: '获取用户信息成功',
      data: results[0],
    })
  })
}
//更新用户信息
exports.updateUserInfo = (req, res) => {
  db.query(sqlUpdateUserInfo, [req.body, req.user.id], (err, results) => {
    console.log(req.body)
    if (err) return res.cc(err)
    if (results.affectedRows !== 1) return res.cc('更新用户信息失败')
    res.cc('更新用户信息成功', 0)
  })
}

//更新用户密码
exports.updatePassword = (req, res) => {
  db.query(sqlUpdatePwdSelect, req.user.id, (err, results) => {
    if (err) return res.cc(err)
    if (results.length !== 1) return res.cc('用户不存在')

    //判断密码是否正确
    //bcrypt.compareSync(提交的密码，数据库中的密码) 方法验证密码是否正确
    const compareResult = bcrypt.compareSync(req.body.oldPwd, results[0].password)
    if (!compareResult) return res.cc('旧密码错误')

    //对新密码进行加密
    const newPwd = bcrypt.hashSync(req.body.newPwd, 10)
    db.query(sqlUpdatePwd,[newPwd,req.user.id],(err,results)=>{
        if(err) return res.cc(err)
        if(results.affectedRows !== 1) return res.cc('更新用户密码失败')
        res.cc('更新密码成功',0)
    })
  })
}

//更换用户头像
exports.updateUserImg = (req,res)=>{
    db.query(sqlUpdateUserImg,[req.body.user_pic,req.user.id],(err,results)=>{
        if(err) return res.cc(err)
        if(results.affectedRows !== 1) return res.cc('更新头像失败')
        res.cc('更换头像成功',0)
    })
}
