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

| 参数 | 是否必选 | 类型 |
| :--- | :------: | :--- |

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

| 参数     | 是否必选 | 类型   |
| :------- | :------: | :----- |
| username |    Y     | string |
| nickname |    Y     | string |
| email    |    Y     | string |

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

| 参数   | 是否必选 | 类型   |
| :----- | :------: | :----- |
| oldPwd |    Y     | string |
| newPwd |    Y     | string |

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

| 参数     | 是否必选 | 类型   |
| :------- | :------: | :----- |
| user_pic |    Y     | base64 |

### 返回示例

```
{
    "status": 0,
    "message": "更换头像成功"
}
```

