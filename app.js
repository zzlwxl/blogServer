const express = require('express')
const app = express()
const cors = require('cors')
const sendErr = require('./middleware/sendErr.js')
const publicErr = require('./middleware/publicErr.js')
const expressJWT = require('express-jwt')
const config = require('./config/config.js')

//解决跨域
app.use(cors())

app.use(sendErr)

//配置解析application/x-www-form-urlencoded格式表单数据
app.use(express.urlencoded({extended:false}))

// 在路由之前配置解析Token的中间件
app.use(expressJWT({secret:config.jwtSecretKey}).unless({path: [/^\/api\//]}))

const userRouter = require('./router/user.js')
//注册路由模块
app.use('/api',userRouter)

// 定义错误级别的中间件
app.use(publicErr)

app.listen(3007,()=>{
    console.log('server running at http://127.0.0.1:3007')
})