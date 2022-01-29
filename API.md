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







