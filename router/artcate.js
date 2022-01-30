const express = require('express')
const router = express.Router()
const artcateHandler = require('../router_handler/artcate.js')
// 验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 需要的验证规则对象
const { addCate_schema ,delCate_schema,getCate_schema,updateCate_schema} = require('../schema/artcate.js')


//获取文章分类
router.get('/cates',artcateHandler.getArticleCates)

//新增文章分类
router.post('/addcates',expressJoi(addCate_schema), artcateHandler.addArticleCates)

//根据分类ID删除文章分类
router.delete('/deletecate/:id',expressJoi(delCate_schema), artcateHandler.deletecateById)

//根据ID获取文章分类数据
router.get('/cates/:id',expressJoi(getCate_schema), artcateHandler.getArtCateById)

//根据ID更新文章分类
router.post('/updatecate',expressJoi(updateCate_schema), artcateHandler.updateCateById)

module.exports = router