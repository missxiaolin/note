# Elasticsearch

## 坑
(http://www.mamicode.com/info-detail-1775575.html)[elasticsearch安装之各种坑]

## 安装
1. 安装java环境 （jre 或者 openjdk）
2. 解压缩要安装到/opt/elasticsearch/下

## 修改内存
Java HotSpot(TM) 64-Bit Server VM warning: INFO: os::commit_memory(0x0000000085330000, 2060255232, 0) failed; error=‘Cannot allocate memory‘ (errno=12)
~~~
vim config/jvm.options
#-Xms2g
#-Xmx2g
-Xms128m
-Xmx128m
~~~

## 添加新用户
~~~
groupadd elsearch
#useradd elsearch -g elsearch -p elasticsearch
useradd elsearch -g elsearch
~~~

## 启动
~~~
./bin/elasticsearch -d
~~~

## 测试
~~~
curl http://localhost:9200/
~~~

## Yum安装 ElasticSearch
~~~
# 下载并安装ES的yum公钥
$ rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
# 配置ES的yum源
$ vim /etc/yum.repos.d/elasticsearch.repo

[elasticsearch-2.x]
name=Elasticsearch repository for 2.x packages
baseurl=http://packages.elastic.co/elasticsearch/2.x/centos
gpgcheck=1
gpgkey=http://packages.elastic.co/GPG-KEY-elasticsearch
enabled=1

$ yum makecache
$ yum install elasticsearch

$ service elasticsearch start

$ vim /etc/elasticsearch/elasticsearch.yml
http.port: 9200
network.host: 0.0.0.0
~~~

## 安装Kibana
~~~
$ rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
$ vim /etc/yum.repos.d/kibana.repo

[kibana-5.x]
name=Kibana repository for 5.x packages
baseurl=https://artifacts.elastic.co/packages/5.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md

$ yum makecache
$ yum install kibana

$ service kibana start

$ vim /etc/kibana/kibana.yml

server.host: "0.0.0.0"

~~~

## Docker启动
~~~
docker run --name elasticsearch --restart unless-stopped -p 9200:9200 -p 9300:9300 \
-v /mnt/elasticsearch/data:/usr/share/elasticsearch/data -e ES_JAVA_OPTS="-Xms128m -Xmx128m" \
-e "discovery.type=single-node" -d elasticsearch
~~~