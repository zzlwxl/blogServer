const express = require('express')
const router = express.Router()
const articleHandler = require('../router_handler/article.js')
// 验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 需要的验证规则对象
const { addArticle_schema ,delArticle_schema,updateArticle_schema,getArticles_schema} = require('../schema/article.js')
// 导入解析 formdata 格式表单数据的包
const multer = require('multer')
const path = require('path')

// 创建 multer 的实例对象，通过 dest 属性指定文件的存放路径
const upload = multer({ dest: path.join(__dirname, '../uploads') })


//发布新文章
/**
 upload.single() 是一个局部生效的中间件，用来解析 FormData 格式的表单数据
 将文件类型的数据，解析并挂载到 req.file 属性中
 将文本类型的数据，解析并挂载到 req.body 属性中

 注意：在当前的路由中，先后使用了两个中间件：
       先使用 multer 解析表单数据
       再使用 expressJoi 对解析的表单数据进行验证
 */
router.post('/add',upload.single('cover_img'),expressJoi(addArticle_schema), articleHandler.addArticle)

//根据ID删除文章
router.delete('/delarticle/:id',expressJoi(delArticle_schema), articleHandler.delArticle)


//根据ID更新文章数据
router.post('/update/articleinfo/:id',upload.single('cover_img'),expressJoi(updateArticle_schema),articleHandler.updateArticle)

//获取指定用户下的所有文章列表
router.get('/byuser/getarticles',expressJoi(getArticles_schema), articleHandler.getArticelByUser)

module.exports = router