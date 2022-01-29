const joi = require('joi')

/**
 * string() 值必须是字符串
 * alphanum() 值只能是包含 a-zA-Z0-9 的字符串
 * required() 值是必填项，不能为 undefined
 * pattern(正则表达式) 值必须符合正则表达式的规则
 */

// 用户名的验证规则
const username = joi.string().alphanum().min(1).max(10).required()
// 密码的验证规则
const password = joi.string().pattern(/^[\S]{6,12}$/).required()
// 定义 nickname,email的验证规则
const nickname = joi.string().required()
const email = joi.string().email().required()
//用户头像验证规则
// dataUri() 指的是：
// data:image/png;base64,VE9PTUFOWVNFQ1JFVFM=
const user_pic = joi.string().dataUri().required()

// 定义注册和登录表单的验证规则对象
exports.login_schema = {
  // 对 req.body 中的数据进行验证
  body: {
    username,
    password
  },
//   query:{},
//   params:{}
}

//定义更新用户信息
exports.updateUserinfo_schema = {
    body:{
        username,
        nickname,
        email
    }
}

//更新用户密码
exports.updatePassword_schema = {
    body: {
      oldPwd: password,
      /**
       使用 joi.not(joi.ref('oldPwd')).concat(password) 规则，验证 req.body.newPwd 的值
       joi.ref('oldPwd') 表示 newPwd 的值必须和 oldPwd 的值保持一致
       joi.not(joi.ref('oldPwd')) 表示 newPwd 的值不能等于 oldPwd 的值
       .concat() 用于合并 joi.not(joi.ref('oldPwd')) 和 password 这两条验证规则
       */
      newPwd: joi.not(joi.ref('oldPwd')).concat(password)
    },
  }
  
//更新用户头像
exports.updateUserImg_schema = {
    body:{
        user_pic
    }
}