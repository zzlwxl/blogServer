const express = require('express')
const app = express()
const cors = require('cors')

//解决跨域
app.use(cors)

//配置解析application/x-www-form-urlencoded格式表单数据
app.use(express.urlencoded({extended:false}))

app.listen(3002,()=>{
    console.log('server running at http://127.0.0.1:3002')
})