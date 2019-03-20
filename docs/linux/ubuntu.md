### 增加ppa源
使用ppa增加源:
~~~
$ sudo apt-get install python-software-properties
$ sudo add-apt-repository ppa:ondrej/php
$ sudo apt-get update
$ sudo apt-get install -y php7.0 php7.0-mysql php7.0-curl php7.0-json php7.0-cgi

然后可以查看php版本:
php -v

关于php5.4--php5.6版本
$ sudo apt-get install python-software-properties
$ sudo add-apt-repository ppa:ondrej/php
$ sudo apt-get update
$ sudo apt-get -y install php5.6 php5.6-mcrypt php5.6-mbstring php5.6-curl php5.6-cli php5.6-mysql php5.6-gd php5.6-intl php5.6-xsl php5.6-zip

查看php7的扩展
sudo apt-cache search php7-* 
~~~

### apt-get 
安装软件
~~~
apt-get install softname1 softname2 softname3……
~~~
卸载软件
~~~
apt-get remove softname1 softname2 softname3……
~~~
卸载并清除配置 
~~~
apt-get remove --purge softname1
~~~
更新软件信息数据库 
~~~
apt-get update
~~~
进行系统升级 
~~~
apt-get upgrade
~~~
搜索软件包 
~~~
apt-cache search softname1 softname2 softname3……
~~~
修正（依赖关系）安装：
~~~
apt-get -f install
~~~
查看需要升级的软件
~~~
apt list --upgradable
~~~

### deb
安装deb软件包 
~~~
dpkg -i xxx.deb
~~~
删除软件包 
~~~
dpkg -r xxx.deb
~~~
连同配置文件一起删除 
~~~
dpkg -r --purge xxx.deb
~~~
查看软件包信息 
~~~
dpkg -info xxx.deb
~~~
查看文件拷贝详情 
~~~
dpkg -L xxx.deb
~~~
查看系统中已安装软件包信息 
~~~
dpkg -l
~~~
重新配置软件包 
~~~
dpkg-reconfigure xx
sudo dpkg -p package_name
~~~
卸载软件包及其配置文件，但无法解决依赖关系！
~~~
sudo aptitude purge pkgname
~~~
卸载软件包及其配置文件与依赖关系包！清除所有已删除包的残馀配置文件 
~~~
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P 
~~~