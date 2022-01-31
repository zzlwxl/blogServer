# 接口列表

## 用户注册

### 请求URL

```
/api/reguser
```

### 示例

[http://127.0.0.1:3007/api/reguser]()

### 请求方式

```
POST
```

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数     | 是否必选 | 类型   | 说明   |
| :------- | :------: | :----- | :----- |
| username |    Y     | string | 用户名 |
| password |    Y     | string | 密码   |
| nickname |    N     | string | 别名   |
| email    |    N     | string | 邮箱   |
| user_pic |    N     | string | 头像   |

### 返回示例

```
{
    "status": 0,
    "message": "注册成功"
}
```
## 用户登录

### 请求URL

```
/api/login
```

### 示例

[http://127.0.0.1:3007/api/login]()

### 请求方式

```
POST
```

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数     | 是否必选 | 类型   | 说明   |
| :------- | :------: | :----- | :----- |
| username |    Y     | string | 用户名 |
| password |    Y     | string | 密码   |

### 返回示例

```
{
    "status": 0,
    "message": "登录成功",
    "token": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywidXNlcm5hbWUiOiJ3eGwiLCJwYXNzd29yZCI6IiIsIm5pY2tuYW1lIjoiIiwiZW1haWwiOm51bGwsInVzZXJfcGljIjoiIiwiaWF0IjoxNjQzNDQyMjg4LCJleHAiOjE2NDM0NDU4ODh9.A0FNMcECAQlcKTBfQrKrKSiekI12c8zmEhqDPGUgEig"
}
```
## 获取用户信息

### 请求URL

```
/my/userinfo
```

### 示例

[http://127.0.0.1:3007/my/userinfo]()

### 请求方式

```
GET
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: 

| 参数 | 是否必选 | 类型 | 说明 |
| :--- | :------: | :--- | ---- |

### 返回示例

```
{
    "status": 0,
    "message": "获取用户信息成功",
    "data": {
        "id": 3,
        "username": "wxl",
        "nickname": "",
        "email": null,
        "user_pic": null
    }
}
```
## 更新用户信息

### 请求URL

```
/my/userinfo
```

### 示例

[http://127.0.0.1:3007/my/userinfo]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数     | 是否必选 | 类型   | 说明     |
| :------- | :------: | :----- | -------- |
| username |    Y     | string | 用户名   |
| nickname |    Y     | string | 用户别名 |
| email    |    Y     | string | 邮箱     |

### 返回示例

```
{
    "status": 0,
    "message": "更新用户信息成功"
}
```
## 更新用户密码

### 请求URL

```
/my/updatepwd
```

### 示例

[http://127.0.0.1:3007/my/updatepwd]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数   | 是否必选 | 类型   | 说明   |
| :----- | :------: | :----- | ------ |
| oldPwd |    Y     | string | 旧密码 |
| newPwd |    Y     | string | 新密码 |

### 返回示例

```
{
    "status": 0,
    "message": "更新密码成功"
}
```
## 更换用户头像

### 请求URL

```
/my/update/userimg
```

### 示例

[http://127.0.0.1:3007/my/update/userimg]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数     | 是否必选 | 类型   | 说明 |
| :------- | :------: | :----- | ---- |
| user_pic |    Y     | base64 | 头像 |

### 返回示例

```
{
    "status": 0,
    "message": "更换头像成功"
}
```
## 获取文章分类

### 请求URL

```
/anyone/artcate/cates
```

### 示例

[http://127.0.0.1:3007/anyone/artcate/cates]()

### 请求方式

```
GET
```

### 参数类型: 

| 参数 | 是否必选 | 类型 | 说明 |
| :--- | :------: | :--- | ---- |

### 返回示例

```
{
    "status": 0,
    "message": "获取文章分类数据成功",
    "data": [
        {
            "id": 1,
            "name": "前端",
            "alias": "qianduan",
            "is_delete": 0
        },
        {
            "id": 2,
            "name": "后端",
            "alias": "houduan",
            "is_delete": 0
        }
    ]
}
```
## 新增文章分类

### 请求URL

```
/my/artcate/addcates
```

### 示例

[http://127.0.0.1:3007/my/artcate/addcates]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数  | 是否必选 | 类型   | 说明     |
| :---- | :------: | :----- | -------- |
| name  |    Y     | string | 分类名   |
| alias |    Y     | string | 分类别名 |

### 返回示例

```
{
    "status": 0,
    "message": "新增文章分类成功"
}
```
## 删除文章分类

### 请求URL

```
/my/artcate/deletecate/:id
```

### 示例

[http://127.0.0.1:3007/my/artcate/deletecate/2]()

### 请求方式

```
DELETE
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Params

| 参数 | 是否必选 | 类型 | 说明   |
| :--- | :------: | :--- | ------ |
| id   |    Y     | int  | 分类ID |

### 返回示例

```
{
    "status": 1,
    "message": "删除文章分类成功"
}
```
## 根据ID获取文章分类数据

### 请求URL

```
/anyone/artcate/cates/:id
```

### 示例

[http://127.0.0.1:3007/anyone/artcate//cates/1]()

### 请求方式

```
GET
```

### 参数类型: Params

| 参数 | 是否必选 | 类型 | 说明   |
| :--- | :------: | :--- | ------ |
| id   |    Y     | int  | 分类ID |

### 返回示例

```
{
    "status": 0,
    "message": "获取文章分类数据成功",
    "data": {
        "id": 1,
        "name": "前端",
        "alias": "qianduan",
        "is_delete": 0
    }
}
```
## 根据ID更新文章分类数据

### 请求URL

```
/my/artcate/updatecate
```

### 示例

[http://127.0.0.1:3007/my/artcate/updatecate]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Body

```
x-www-form-urlencoded格式
```

| 参数  | 是否必选 | 类型   | 说明     |
| :---- | :------: | :----- | -------- |
| id    |    Y     | int    | 分类ID   |
| name  |    Y     | string | 分类名   |
| alias |    Y     | string | 分类别名 |

### 返回示例

```
{
    "status": 0,
    "message": "更新文章分类数据成功"
}
```
## 新增文章

### 请求URL

```
/my/article/addcates
```

### 示例

[http://127.0.0.1:3007/my/article/addcates]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Body

```
form-data格式
```

| 参数      | 是否必选 | 类型   | 说明               |
| :-------- | :------: | :----- | ------------------ |
| title     |    Y     | string | 文章标题           |
| cate_id   |    Y     | int    | 所属分类ID         |
| content   |    Y     | string | 文章内容           |
| cover_img |    Y     | file   | 文章封面           |
| state     |    Y     | string | 状态，已发布、草稿 |

### 返回示例

```
{
    "status": 0,
    "message": "发布文章成功"
}
```
## 获取所有文章列表

### 请求URL

```
/anyone/article/getarticles
```

### 示例

[http://127.0.0.1:3007/anyone/article/getarticles]()

### 请求方式

```
GET
```

### 参数类型: query

| 参数   | 是否必选 | 类型 | 说明                   |
| :----- | :------: | :--- | ---------------------- |
| offset |    N     | int  | 跳过多少条数据，默认0  |
| limit  |    N     | int  | 请求数据的数量，默认10 |

### 返回示例

```
{
    "status": 0,
    "message": "获取文章列表成功",
    "data": [
        {
            "id": 33,
            "title": "标题2",
            "content_view": "携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义...",
            "cover_img": "/uploads/2e6b9bf310618edd10c053c50261bd0d.jpg",
            "pub_date": "2022-01-30 20:49:59.766",
            "state": "已发布",
            "cate_id": 5,
            "author_id": 16
        },
        {
            "id": 34,
            "title": "标题3",
            "content_view": "t认证Express创建服务器、监听GET、POST请求、把内容响应给客户端、获取URL中携带的查询...",
            "cover_img": "/uploads/9ebfa12d695f776466aa0fdba1680d03.jpg",
            "pub_date": "2022-01-30 21:14:00.781",
            "state": "已发布",
            "cate_id": 5,
            "author_id": 16
        }
    ]
}
```
## 获取指定用户下所有文章列表

### 请求URL

```
/my/article/byuser/getarticles
```

### 示例

[http://127.0.0.1:3007/my/article/byuser/getarticles]()

### 请求方式

```
GET
```
### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: query

| 参数   | 是否必选 | 类型 | 说明                   |
| :----- | :------: | :--- | ---------------------- |
| offset |    N     | int  | 跳过多少条数据，默认0  |
| limit  |    N     | int  | 请求数据的数量，默认10 |

### 返回示例

```
{
    "status": 0,
    "message": "获取文章列表成功",
    "data": [
        {
            "id": 33,
            "title": "标题2",
            "content_view": "携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义...",
            "cover_img": "/uploads/2e6b9bf310618edd10c053c50261bd0d.jpg",
            "pub_date": "2022-01-30 20:49:59.766",
            "state": "已发布",
            "cate_id": 5,
            "author_id": 16
        },
        {
            "id": 34,
            "title": "标题3",
            "content_view": "t认证Express创建服务器、监听GET、POST请求、把内容响应给客户端、获取URL中携带的查询...",
            "cover_img": "/uploads/9ebfa12d695f776466aa0fdba1680d03.jpg",
            "pub_date": "2022-01-30 21:14:00.781",
            "state": "已发布",
            "cate_id": 5,
            "author_id": 16
        }
    ]
}
```
## 用户根据ID删除文章

### 请求URL

```
/my/article/delarticle/:id
```

### 示例

[http://127.0.0.1:3007/my/article/delarticle/32]()

### 请求方式

```
DELETE
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Params

| 参数 | 是否必选 | 类型 | 说明   |
| :--- | :------: | :--- | ------ |
| id   |    Y     | int  | 文章ID |

### 返回示例

```
{
    "status": 0,
    "message": "删除文章成功"
}
```
## 根据ID获取文章详情

### 请求URL

```
/anyone/article/getarticle/info/:id
```

### 示例

[http://127.0.0.1:3007/anyone/article/getarticle/info/34]()

### 请求方式

```
GET
```

### 参数类型: Params

| 参数 | 是否必选 | 类型 | 说明   |
| :--- | :------: | :--- | ------ |
| id   |    Y     | int  | 文章ID |

### 返回示例

```
{
    "status": 0,
    "message": "获取文章详情成功",
    "data": [
        {
            "id": 34,
            "title": "标题3",
            "content": "t认证Express创建服务器、监听GET、POST请求、把内容响应给客户端、获取URL中携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义中间件、cors中间件解决跨域问题、cors响应头部、JSONP接口、session认证、jwt认证携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义中间件、cors中间件解决跨域问题、cors响应头部、JSONP接口、session认证、jwt认证Express创建服务器、监听GET、POST请求、把内容响应给客户端、获取URL中携带的查询参数、动态参数、托管静态资源、模块化路由、中间件、全局生效、局部生效、中间件的分类、自定义中间件、cors中间件解决跨域问题、cors响应头部、JSONP接口、session认证、jwt认证",
            "pub_date": "2022-01-30 21:14:00.781",
            "state": "已发布",
            "cate_id": 5,
            "author_id": 16
        }
    ]
}
```
## 根据ID更新文章

### 请求URL

```
/my/article/update/articleinfo/:id
```

### 示例

[http://127.0.0.1:3007/my/article/update/articleinfo/34]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |
### 参数类型: Params

| 参数 | 是否必选 | 类型 | 说明   |
| :--- | :------: | :--- | ------ |
| id   |    Y     | int  | 文章ID |

### 参数类型: Body

```
form-data格式
```

| 参数      | 是否必选 | 类型   | 说明               |
| :-------- | :------: | :----- | ------------------ |
| title     |    N     | string | 文章标题           |
| cate_id   |    N     | int    | 所属分类ID         |
| content   |    N     | string | 文章内容           |
| cover_img |    N     | file   | 文章封面           |
| state     |    N     | string | 状态，已发布、草稿 |

### 备注

如果某一个属性没做任何修改，那么，前端在提交表单的时候，要移除这个属性。建议单独对content输入框加一个事件：只有输入内容了才会提交这个属性。

### 返回示例

```
{
    "status": 0,
    "message": "更新文章成功"
}
```