const express = require('express')
const app = express()
const cors = require('cors')
const sendErr = require('./middleware/sendErr.js')
const publicErr = require('./middleware/publicErr.js')
const expressJWT = require('express-jwt')
const config = require('./config/config.js')
const history = require('connect-history-api-fallback');

//解决跨域
app.use(cors())
app.use(history(
    {
        htmlAcceptHeaders: ['text/html', 'application/xhtml+xml']
    }
));

// 托管静态资源文件
app.use('/uploads', express.static('./uploads'))

app.use(sendErr)

//配置解析application/x-www-form-urlencoded格式表单数据
app.use(express.urlencoded({extended:false}))

// 在路由之前配置解析Token的中间件
app.use(expressJWT({secret:config.jwtSecretKey}).unless({path: [/^\/api\//,/^\/anyone\//]}))

const userRouter = require('./router/user.js')
const userinfoRouter = require('./router/userinfo.js')
const artCateRouter = require('./router/artcate.js')
const artCateAnyoneRouter = require('./router/anyoneArtcate.js')
const articleRouter = require('./router/article.js')
const articleAnyoneRouter = require('./router/anyoneArticle.js')



//注册路由模块
app.use('/api',userRouter)
app.use('/my',userinfoRouter)
app.use('/my/artcate',artCateRouter)
app.use('/anyone/artcate',artCateAnyoneRouter)
app.use('/my/article',articleRouter)
app.use('/anyone/article',articleAnyoneRouter)

// 定义错误级别的中间件
app.use(publicErr)

app.listen(3007,()=>{
    console.log('server running at http://127.0.0.1:3007')
})