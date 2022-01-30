const express = require('express')
const router = express.Router()
const artcateHandler = require('../router_handler/artcate.js')

//获取文章分类
router.get('/cates',artcateHandler.getArticleCates)

module.exports = router