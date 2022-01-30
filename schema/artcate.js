const joi = require('joi')

// 定义 分类名称 和 分类别名 的校验规则
const name = joi.string().required()
const alias = joi.string().alphanum().required()
// 定义 分类Id 的校验规则
const id = joi.number().integer().min(1).required()

//添加文章分类
exports.addCate_schema = {
  body: {
    name,
    alias,
  },
}

//删除文章分类
exports.delCate_schema ={
    params:{
        id
    }
}

//根据ID获取文章分类
exports.getCate_schema ={
    params:{
        id
    }
}

//根据ID更新文章分类
// 校验规则对象 - 更新分类
exports.updateCate_schema = {
    body: {
      id,
      name,
      alias,
    }
  }
  