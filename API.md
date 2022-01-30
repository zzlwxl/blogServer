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

### 参数类型: 

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

### 参数类型: 

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

### 参数类型: 

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
/my/article/cates
```

### 示例

[http://127.0.0.1:3007/my/article/cates]()

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

### 参数类型: 

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
/my/article/deletecate/:id
```

### 示例

[http://127.0.0.1:3007/my/article/deletecate/2]()

### 请求方式

```
DELETE
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Params

| 参数 | 是否必选 | 类型   | 说明   |
| :--- | :------: | :----- | ------ |
| id   |    Y     | string | 分类ID |

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
/my/article/cates/:id
```

### 示例

[http://127.0.0.1:3007/my/article//cates/1]()

### 请求方式

```
GET
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: Params

| 参数 | 是否必选 | 类型   | 说明   |
| :--- | :------: | :----- | ------ |
| id   |    Y     | string | 分类ID |

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
/my/article/updatecate
```

### 示例

[http://127.0.0.1:3007/my/article/updatecate]()

### 请求方式

```
POST
```

### Header
| 参数          |  Value  |
| :------------ | :-----: |
| Authorization | token值 |

### 参数类型: 

| 参数  | 是否必选 | 类型   | 说明     |
| :---- | :------: | :----- | -------- |
| id    |    Y     | string | 分类ID   |
| name  |    Y     | string | 分类名   |
| alias |    Y     | string | 分类别名 |

### 返回示例

```
{
    "status": 0,
    "message": "更新文章分类数据成功"
}
```
