//用户注册
exports.sqlReguser=`select * from ev_users where username=?`
//用户登录
exports.sqlLogin=`select * from ev_users where username=?`
//获取用户基本信息
exports.sqlUserInfo = `select id, username, nickname, email, user_pic from ev_users where id=?`
//更新用户基本信息
exports.sqlUpdateUserInfo = `update ev_users set ? where id=?`
//更新用户秘密_查询用户信息
exports.sqlUpdatePwdSelect = `select * from ev_users where id=?`
//更新用户密码
exports.sqlUpdatePwd = `update ev_users set password=? where id=?`
//更新用户头像
exports.sqlUpdateUserImg = `update ev_users set user_pic=? where id=?`
//获取文章分类
exports.sqlArtCates = `select * from ev_article_cate where is_delete=0 order by id asc`
//新增文章分类_查询分类名字是否被占用
exports.sqlAddArtCatesSelect = `select * from ev_article_cate where name=? or alias=?`
//新增文章分类
exports.sqlAddArtCates = `insert into ev_article_cate set ?`
//删除文章分类
exports.sqlDelArtCates = `update ev_article_cate set is_delete=1 where id=?`
//根据ID获取文章分类数据
exports.sqlGetArtCates = `select * from ev_article_cate where id=?`
//根据ID更新文章分类数据_查询分类名字是否被占用
exports.sqlUpdateCateSelect = `select * from ev_article_cate where Id<>? and (name=? or alias=?)`
//根据ID更新文章分类数据
exports.sqlUpdateCate = `update ev_article_cate set ? where id=?`
//发布新文章
exports.sqlAddArticle = `insert into ev_articles set ?`
//获取所有文章列表
exports.sqlGetArticle = `select id,title,content_view,cover_img,pub_date,state,cate_id,author_id from ev_articles limit ?,?`
//获取分类下所有文章列表
exports.sqlGetArticleByCate = `select id,title,content_view,cover_img,pub_date,state,cate_id,author_id from ev_articles where cate_id=? limit ?,?`
//获取指定用户下的所有文章列表
exports.sqlGetArticleByUser = `select id,title,content_view,cover_img,pub_date,state,cate_id,author_id from ev_articles where author_id=? limit ?,?`
//用户根据ID删除文章
exports.sqlDelArticle = `delete from ev_articles where id=? and author_id=?`
//根据ID获取文章详情
exports.sqlGetArticleInfo = `select id,title,content,pub_date,state,cate_id,author_id from ev_articles where id=?`
//根据ID更新文章数据
exports.sqlUpdateArticle = `update ev_articles set ? where id=?`