const express = require('express')
const router = express.Router()
const articleHandler = require('../router_handler/article.js')
// 验证表单数据的中间件
const expressJoi = require('@escook/express-joi')
// 需要的验证规则对象
const {getArticleInfo_schema} = require('../schema/article.js')

//获取文章的列表数据
router.get('/getarticles', articleHandler.getArticals)

//获取分类下文章的列表数据
router.get('/getarticles/bycate', articleHandler.getArticalsByCate)

//根据ID获取文章详情
router.get('/getarticle/info/:id',expressJoi(getArticleInfo_schema), articleHandler.getArticalInfo)


module.exports = router