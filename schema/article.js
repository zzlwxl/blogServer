const joi = require('joi')

// 定义 标题、分类Id、内容、发布状态 的验证规则
const title = joi.string().required()
const cate_id = joi.number().integer().min(1).required()
const content = joi.string().required().allow('')
const state = joi.string().valid('已发布', '草稿')
const title2 = joi.string()
const cate_id2 = joi.number().integer().min(1)
const state2 = joi.string().valid('已发布', '草稿')
const id = joi.number().integer().min(1).required()

//发布文章
exports.addArticle_schema = {
  body: {
    title,
    cate_id,
    content,
    state,
  },
}

//更新文章
exports.updateArticle_schema = {
  body: {
    title:title2,
    cate_id:cate_id2,
    content,
    state:state2,
  },
}

//根据ID删除文章
exports.delArticle_schema = {
    params:{
        id
    }
}

//根据ID获取文章详情
exports.getArticleInfo_schema = {
    params:{
        id
    }
}