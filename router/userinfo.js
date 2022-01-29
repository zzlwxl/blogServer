const express = require('express')
const router = express.Router()
const UserInfoHandler = require('../router_handler/userinfo.js')
// 验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 需要的验证规则对象
const { updateUserinfo_schema , updatePassword_schema,updateUserImg_schema} = require('../schema/user.js')

//获取用户基本信息
router.get('/userinfo',UserInfoHandler.getUserInfo)

//更新用户信息
router.post('/userinfo',expressJoi(updateUserinfo_schema), UserInfoHandler.updateUserInfo)

//更新用户密码
router.post('/updatepwd',expressJoi(updatePassword_schema), UserInfoHandler.updatePassword)

//更新用户头像
router.post('/update/userimg',expressJoi(updateUserImg_schema), UserInfoHandler.updateUserImg)




module.exports=router