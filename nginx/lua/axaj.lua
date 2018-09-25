-- https://github.com/pintsized/lua-resty-http
local http = require 'resty.http'

-- https://github.com/rxi/json.lua
local json = require 'resty.json'

-- nginx location配置中set的$redirect_url变量
local redirect_url = ngx.var.redirect_url

-- 获取http请求类型
local request_method = ngx.var.request_method

-- 获取请求头中的cookie信息
local headers = ngx.req.get_headers()
local cookie = headers.cookie

-- 将所有与请求相关的信息放到body变量中，统一转发
local body = {
    -- 获取请求uri，不包含查询参数
    url = ngx.var.uri,

    -- 获取请求参数
    query = ngx.req.get_uri_args(),

    -- http请求类型
    type = request_method,

    -- post的请求体
    post = nil
}

-- 如果是post请求，则读取请求体，加入body变量中
if "POST" == request_method then 
    ngx.req.read_body()
    body.post = ngx.req.get_post_args()
end

-- 重新发起http请求
local httpc = http:new()
local res, err = httpc:request_uri(redirect_url, {
    method = 'POST',

    -- 将body编码为json格式
    body = json.encode(body),
    headers = {
        ["Content-Type"] = "application/json",

        -- 携带cookie发起请求，避免cookie或session丢失
        Cookie = cookie
    }
})

-- 返回响应体
ngx.say(res.body)