const express = require('express')
const router = express.Router()
const artcateHandler = require('../router_handler/artcate.js')
// 验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 需要的验证规则对象
const {getCate_schema} = require('../schema/artcate.js')

//获取文章分类
router.get('/cates',artcateHandler.getArticleCates)

//根据ID获取文章分类数据
router.get('/cates/:id',expressJoi(getCate_schema), artcateHandler.getArtCateById)


module.exports = router