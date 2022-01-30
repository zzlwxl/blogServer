const db = require('../db/index.js')
const bcrypt = require('bcryptjs')
const {sqlUpdateCate, sqlArtCates, sqlAddArtCatesSelect, sqlAddArtCates, sqlDelArtCates, sqlGetArtCates, sqlUpdateCateSelect } = require('../db/sqlStr.js')

//获取文章分类
exports.getArticleCates = (req, res) => {
  db.query(sqlArtCates, (err, results) => {
    if (err) return res.cc(err)
    res.send({
      status: 0,
      message: '获取文章分类数据成功',
      data: results,
    })
  })
}

//新增文章分类
exports.addArticleCates = (req, res) => {
  db.query(sqlAddArtCatesSelect, [req.body.name, req.body.alias], (err, results) => {
    if (err) return res.cc(err)
    if (results.length === 2) return res.cc('分类名称与分类别名被占用，请更换后重试')
    if (results.length === 1 && results[0].name === req.body.name && results[0].alias === req.body.alias) return res.cc('分类名称与分类别名被占用，请更换后重试')
    if (results.length === 1 && results[0].name === req.body.name) return res.cc('分类名称被占用，请更换后重试')
    if (results.length === 1 && results[0].alias === req.body.alias) return res.cc('分类别名被占用，请更换后重试')
    db.query(sqlAddArtCates, req.body, (err, results) => {
      if (err) return res.cc(err)
      if (results.affectedRows !== 1) return res.cc('新增文章分类失败')
      res.cc('新增文章分类成功', 0)
    })
  })
}

//删除文章分类
exports.deletecateById = (req, res) => {
  db.query(sqlDelArtCates, req.params.id, (err, results) => {
    if (err) return res.cc(err)
    if (results.affectedRows !== 1) return res.cc('删除文章分类失败')
    res.cc('删除文章分类成功')
  })
}

//根据ID获取文章分类
exports.getArtCateById = (req, res) => {
  db.query(sqlGetArtCates, req.params.id, (err, results) => {
    if (err) return res.cc(err)
    if (results.length !== 1) return res.cc('获取文章分类数据失败')
    res.send({
      status: 0,
      message: '获取文章分类数据成功',
      data: results[0],
    })
  })
}

//根据ID更新文章分类
exports.updateCateById = (req, res) => {
  db.query(sqlUpdateCateSelect, [req.body.id, req.body.name, req.body.alias], (err, results) => {
    if (err) return res.cc(err)
    if (results.length === 2) return res.cc('分类名称与别名被占用，请更换后重试')
    if (results.length === 1 && results[0].name === req.body.name && results[0].alias === req.body.alias) return res.cc('分类名称与别名被占用，请更换后重试')
    if (results.length === 1 && results[0].name === req.body.name) return res.cc('分类名称被占用，请更换后重试')
    if (results.length === 1 && results[0].alias === req.body.alias) return res.cc('分类别名被占用，请更换后重试')
    
    db.query(sqlUpdateCate,[req.body,req.body.id],(err,results)=>{
        if(err) return res.cc(err)
        if(results.affectedRows !== 1) return res.cc('更新文章分类数据失败')
        res.cc('更新文章分类数据成功',0)
    })
  })
}
