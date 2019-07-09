## 简介

当系统变的复杂，配置项越来越多，一方面配置管理变得繁琐，另一方面配置修改后需要重新上线同样十分痛苦。这时候，需要有一套集中化配置管理系统，一方面提供统一的配置管理，另一方面提供配置变更的自动下发，及时生效。

说道统一配置管理系统，大家应该比较熟悉，常见的：zookeeper、etcd、consul、git等等。

### 安装部署

~~~
# Download the binary
wget https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64
 
# 重命名二进制文件，并移动到PATH的目录下
mv confd-0.16.0-linux-amd64 /usr/local/bin/confd
chmod +x /usr/local/bin/confd
 
# 验证是否安装成功

confd --version

~~~

### 与etcd交互

~~~
// 执行一次
confd -onetime -backend etcd -node http://127.0.0.1:2379
// 每隔60s刷新一次
confd -interval 60 -backend etcd -node http://127.0.0.1:2379 -node http://192.168.9.102:4001 
// 监听
confd -watch -backend etcd -node http://127.0.0.1:2379
~~~

### 与etcdv3交互

~~~
confd -onetime -backend etcdv3 -node http://127.0.0.1:2379
~~~

### 与consul交互

~~~
confd -onetime -backend consul -node 127.0.0.1:8500
~~~

### 与env交互

~~~
confd -onetime -backend env
~~~

### 与file交互

~~~
confd -onetime -backend file -file myapp.yaml
~~~

### 与redis交互

~~~
confd -onetime -backend redis -node 192.168.255.210:6379
confd -onetime -backend redis -node 192.168.255.210:6379/4
~~~

### 与rancher交互

~~~
confd -onetime -backend rancher -prefix /2015-07-25
~~~

### 执行目录

~~~
/etc/confd
~~~

#### 配置文件在conf.d下,例如nginx.toml:

~~~
[template]
prefix = "/nginx"
src = "nginx.tmpl"
dest = "/usr/local/etc/nginx/servers/nginx.conf"
owner = "nginx"
mode = "0644"
keys = [
  "/domain",
  "/pass",
  "/upstream",
]
check_cmd = "nginx -t"
reload_cmd = "nginx -s reload"
~~~

#### 模板文件在templates下，例如nginx.tmpl:

~~~
upstream {{getv "/pass"}} {
{{range getvs "/upstream/*"}}
    server {{.}};
{{end}}
}

server {
    listen 80;
    server_name  {{getv "/domain"}};
    location / {
        proxy_pass        http://{{getv "/pass"}};
        proxy_redirect    off;
        proxy_set_header  Host             $host;
        proxy_set_header  X-Real-IP        $remote_addr;
        proxy_set_header  X-Forwarded-For  $proxy_add_x_forwarded_for;
   }
}
~~~


