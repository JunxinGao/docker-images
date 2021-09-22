# docker-images
![CI](https://github.com/junxingao/docker-images/workflows/Docker Image CI/badge.svg)
## 插入式Dockerfile通用模块配置
写Dockerfile的时候常常遇到一些软件环境是通用的，例如在ubuntu系统上总是要安装固定的软件，python环境总是需要下载conda安装，但由于构建的基础镜像不同就会重复写类似的Dockerfile。

我们可以把ubuntu固定的软件、conda下载包的安装都写成一个通用的模块，此仓库中使用的是Dockerfile.install来表示，在编写一个新的Dockerfile可以引入这些模块，此仓库中使用common_install按行指定通用模块的名字。

这样的话在build的时候就可以自动引入通用模块而不去重复写类似的安装命令。
