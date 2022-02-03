const joi = require('joi')

const publicErr = (err,req,res,next)=>{
    //验证失败导致的错误
    if(err instanceof joi.ValidationError){
       return res.cc(err)
    }
    
    //token身份认证失败
    if(err.name === 'UnauthorizedError') return res.cc('身份认证失败',401)

    //未知的错误
    res.cc(err)
}
module.exports=publicErr