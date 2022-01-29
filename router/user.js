const express = require('express')
const router = express.Router()
const userHandler = require('../router_handler/user.js')
// 验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 需要的验证规则对象
const { login_schema } = require('../schema/user.js')


//注册新用户
/**
 * 用户请求这个地址，提交的参数会先进入这个expressJoi中间件里面进行验证。
 * 验证通过后，会把这次请求转交给后面的路由处理函数userHandler.regUser。
 * 验证失败后，终止后续代码，并抛出一个全局的Error错误，进入全局错误级别的中间件进行处理
 */
router.post('/reguser',expressJoi(login_schema), userHandler.regUser)

//登录
router.post('/login',expressJoi(login_schema), userHandler.login)

module.exports=router