const sendErr = (req,res,next)=>{
    // status=0为成功 1为失败
    res.cc=(err,status=1)=>{
        res.send({
            status,
            //判断err是错误对象还是字符串
            message: err instanceof Error ? err.message : err
        })
    }
    next()
}
module.exports=sendErr