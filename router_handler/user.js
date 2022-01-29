const db = require('../db/index.js')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')
const config =require('../config/config.js')
const {sqlReguser,sqlLogin} = require('../db/sqlStr.js')

// 注册用户
exports.regUser = (req,res)=>{
    //获取客户端提交给服务器的用户信息
    const userinfo = req.body
    if(!userinfo.username || !userinfo.password){
        return res.cc('用户名或密码不合法')
    }

    db.query(sqlReguser,[userinfo.username],(err,results)=>{
        //执行sql语句失败
        if(err){
            // return res.send({status:1,message:err.message})
            return res.cc(err)
        }

        if(results.length > 0){
            // return res.send({status:1,message:'用户名被占用，请更换其他用户名'})
            return res.cc('用户名被占用，请更换其他用户名')
        }

        //对密码进行加密重新赋值
        userinfo.password = bcrypt.hashSync(userinfo.password,10)
        //插入新用户
        const sqlInsertUser =  'insert into ev_users set ?'
        db.query(sqlInsertUser,{username:userinfo.username,password:userinfo.password},(err,result)=>{
            if(err) return res.send({status:1,message:err.message})
            //表的行数没有受到影响
            if(result.affectedRows !== 1){
                return res.cc('注册用户失败，请稍后重试')
            }
            // res.send({status:0,message:'注册成功'})
            res.cc('注册成功',0)
        })
    })
}

//登录
exports.login = (req,res)=>{
    const userinfo = req.body

    //查询用户信息
    db.query(sqlLogin,userinfo.username,(err,results)=>{
        if(err) return res.cc(err)
        //获取的数据条数不等于1
        if(results.length !== 1) return res.cc('登录失败')

        //判断密码是否正确，用bcrypt.compareSync进行解密比较
        const compareResult = bcrypt.compareSync(userinfo.password,results[0].password)
        if(!compareResult) return res.cc('密码错误')

        //生成Token字符串，不包括密码和头像
        const user = {...results[0],password:'',user_pic:''}
        // 对用户的信息进行加密，生成Token字符串
        const tokenStr = jwt.sign(user,config.jwtSecretKey,{expiresIn:config.expiresIn})
        //将Token响应给客户端
        res.send({
            status:0,
            message:'登录成功',
            token: 'Bearer '+tokenStr
        })

    })
}