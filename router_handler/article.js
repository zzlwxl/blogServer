const db = require('../db/index.js')
const {sqlGetArticleByCate, sqlAddArticle, sqlGetArticle, sqlDelArticle, sqlGetArticleInfo ,sqlUpdateArticle,sqlGetArticleByUser} = require('../db/sqlStr.js')
const path = require('path')
const fs = require('fs')

Date.prototype.Format = function (fmt) {
  var o = {
      "M+": this.getMonth() + 1, //月份 
      "d+": this.getDate(), //日 
      "H+": this.getHours(), //小时 
      "m+": this.getMinutes(), //分 
      "s+": this.getSeconds(), //秒 
      "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
      "S": this.getMilliseconds() //毫秒 
  };
  if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
  for (var k in o)
  if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
  return fmt;
}
//发布新文章
exports.addArticle = (req, res) => {
  // 手动判断是否上传了文章封面
  // if (!req.file || req.file.fieldname !== 'cover_img') return res.cc('文章封面是必选参数')
  const articleInfo = {
    // 标题、内容、状态、所属的分类Id
    ...req.body,
    //展示文章列表时的部分文章内容
    content_view: req.body.content.slice(0, 50) + '...',
    // 文章封面在服务器端的存放路径
    // cover_img: path.join('/uploads', req.file.filename + path.extname(req.file.originalname)),
    // 文章发布时间
    pub_date: new Date().Format("yyyy-MM-dd HH:mm"),
    // 文章作者的Id
    author_id: req.user.id,
  }


  db.query(sqlAddArticle, articleInfo, (err, results) => {
    console.log('ggg')
    if (err) return res.cc(err)
    if (results.affectedRows !== 1) return res.cc('发布文章失败')
    res.cc('发布文章成功', 0)
    // console.log(path.extname(req.file.originalname))
    //获取服务器里存的图片地址 /blogServe/uploads/10606e4422c8962ce2c82034f7b66435
    // let oldName = req.file.path
    //注：path.extname(req.file.originalname) 获取的是文件扩展名,对旧名字进行拼接为新文件名
    // let newName = req.file.path + path.extname(req.file.originalname)
    //将老的文件名改成新的有后缀的文件
    // fs.renameSync(oldName, newName)
  })
}

//获取所有文章列表
exports.getArticals = (req, res) => {
  console.log('获取所有文章',req.query)
  db.query(sqlGetArticle,[req.query.offset ? parseInt(req.query.offset) : 0,req.query.limit ? parseInt(req.query.limit) : 10],(err, results) => {
    if (err) return res.cc(err)
    res.send({
      status: 0,
      message: '获取文章列表成功',
      data: results,
    })
  })
}

//获取分类下所有文章列表
exports.getArticalsByCate = (req, res) => {
  console.log(parseInt(req.query.cate_id))
  db.query(sqlGetArticleByCate,[parseInt(req.query.cate_id),req.query.offset ? parseInt(req.query.offset) : 0,req.query.limit ? parseInt(req.query.limit) : 10],(err, results) => {
    if (err) return res.cc(err)
    res.send({
      status: 0,
      message: '获取文章列表成功',
      data: results,
    })
  })
}
//根据ID删除文章
exports.delArticle = (req, res) => {
  db.query(sqlDelArticle, [req.params.id, req.user.id], (err, results) => {
    if (err) return res.cc(err)
    if (results.affectedRows !== 1) return res.cc('删除文章失败')
    res.cc('删除文章成功', 0)
  })
}

//根据ID获取文章详情
exports.getArticalInfo = (req, res) => {
  db.query(sqlGetArticleInfo, req.params.id, (err, results) => {
    if (err) return res.cc(err)
    if (results.length === 0) return res.cc('没有此文章')
    res.send({
      status: 0,
      message: '获取文章详情成功',
      data: results,
    })
  })
}

//根据ID更新文章数据
exports.updateArticle = (req, res) => {
//   console.log(req.body) // 文本类型的数据
//   console.log('------------------')
//   console.log(req.file) // 文件类型的数据

  const articleInfo = {
    // 标题、内容、状态、所属的分类Id
    ...req.body,
  }
  
  //如果用户没有修改某一个值，则数据库对应的字段不作任何修改
  !req.body.title ? delete req.body.title : ''
  !req.body.cate_id ? delete req.body.cate_id : ''
  !req.body.content ? delete req.body.content : articleInfo.content_view= req.body.content.slice(0, 50) + '...',
  !req.body.state ? delete req.body.state : ''
  if(req.file && req.file.fieldname == 'cover_img') {
     articleInfo.cover_img= path.join('/uploads', req.file.filename + path.extname(req.file.originalname))
  }

  db.query(sqlUpdateArticle, [articleInfo,req.params.id], (err, results) => {
    if (err) return res.cc(err)
    if (results.affectedRows !== 1) return res.cc('更新文章失败')
    res.cc('更新文章成功', 0)
    //修改了封面
    if(req.file && req.file.fieldname == 'cover_img'){
        console.log('封面修改了',path.extname(req.file.originalname))
        //获取服务器里存的图片地址 /blogServe/uploads/10606e4422c8962ce2c82034f7b66435
        let oldName = req.file.path
        //path.extname(req.file.originalname) 获取的是文件扩展名,对旧名字进行拼接为新文件名
        let newName = req.file.path + path.extname(req.file.originalname)
        //将老的文件名改成新的有后缀的文件
        fs.renameSync(oldName, newName)
    }
  })
}

//获取指定用户下的文章列表
exports.getArticelByUser=(req,res)=>{
  console.log(req.user)
    db.query(sqlGetArticleByUser,[req.user.id,req.query.offset ? parseInt(req.query.offset) : 0,req.query.limit ? parseInt(req.query.limit) : 10],(err,results)=>{
        if(err) return res.cc(err)
        res.send({
            status:0,
            message:'获取文章列表成功',
            data:results
        })
    })
}