### go modules的讲解和代码

#### go mod之，生成go.mod文件

~~~
go mod init go_moudules_demo
语法
go mod init [module]
~~~

#### 语法解析

~~~
go mod init:初始化modules
go mod download:下载modules到本地cache
go mod edit:编辑go.mod文件，选项有-json、-require和-exclude，可以使用帮助go help mod edit
go mod graph:以文本模式打印模块需求图
go mod tidy:检查，删除错误或者不使用的modules，下载没download的package
go mod vendor:生成vendor目录
go mod verify:验证依赖是否正确
go mod why：查找依赖

go test    执行一下，自动导包

go list -m  主模块的打印路径
go list -m -f={{.Dir}}  print主模块的根目录
go list -m all  查看当前的依赖和版本信息
~~~

#### linux下的尝试

~~~
replace (
	cloud.google.com/go => github.com/googleapis/google-cloud-go v0.34.0
	github.com/go-tomb/tomb => gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7
	go.opencensus.io => github.com/census-instrumentation/opencensus-go v0.19.0
	go.uber.org/atomic => github.com/uber-go/atomic v1.3.2
	go.uber.org/multierr => github.com/uber-go/multierr v1.1.0
	go.uber.org/zap => github.com/uber-go/zap v1.9.1

	golang.org/x/crypto => github.com/golang/crypto v0.0.0-20181001203147-e3636079e1a4
	golang.org/x/lint => github.com/golang/lint v0.0.0-20181026193005-c67002cb31c3
	golang.org/x/net => github.com/golang/net v0.0.0-20180826012351-8a410e7b638d
	golang.org/x/oauth2 => github.com/golang/oauth2 v0.0.0-20180821212333-d2e6202438be
	golang.org/x/sync => github.com/golang/sync v0.0.0-20181108010431-42b317875d0f
	golang.org/x/sys => github.com/golang/sys v0.0.0-20181116152217-5ac8a444bdc5
	golang.org/x/text => github.com/golang/text v0.3.0
	golang.org/x/time => github.com/golang/time v0.0.0-20180412165947-fbb02b2291d2
	golang.org/x/tools => github.com/golang/tools v0.0.0-20181219222714-6e267b5cc78e
	google.golang.org/api => github.com/googleapis/google-api-go-client v0.0.0-20181220000619-583d854617af
	google.golang.org/appengine => github.com/golang/appengine v1.3.0
	google.golang.org/genproto => github.com/google/go-genproto v0.0.0-20181219182458-5a97ab628bfb
	google.golang.org/grpc => github.com/grpc/grpc-go v1.17.0
	gopkg.in/alecthomas/kingpin.v2 => github.com/alecthomas/kingpin v2.2.6+incompatible
	gopkg.in/mgo.v2 => github.com/go-mgo/mgo v0.0.0-20180705113604-9856a29383ce
	gopkg.in/vmihailenco/msgpack.v2 => github.com/vmihailenco/msgpack v2.9.1+incompatible
	gopkg.in/yaml.v2 => github.com/go-yaml/yaml v0.0.0-20181115110504-51d6538a90f8
	labix.org/v2/mgo => github.com/go-mgo/mgo v0.0.0-20160801194620-b6121c6199b7
	launchpad.net/gocheck => github.com/go-check/check v0.0.0-20180628173108-788fd7840127
)
~~~

#### 环境变量设置

~~~
export GOPATH=/Users/web/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPROXY=https://goproxy.io
export GO111MODULE=on
~~~
