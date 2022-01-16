# Files

这个项目提供了Files App(files.photo.gallery) 一款简洁漂亮的目录程序的docker镜像

![Docker Pulls](https://img.shields.io/docker/pulls/cjy0526/files)

<p align="center">
<a href="README.md">English</a> | 中文
</p>

### 介绍

出于学习研究的目的，我将`files.js`替换成了去除授权代码的破解版。

因此你可以直接运行这个镜像用于展示自己的文件。

如有能力，请支持正版。



### 使用

你可以直接拉取运行已经上传到dockerhub上的镜像:

```
docker pull cjy0526/files:v1
docker run -d --name files -v /root/content:/var/www/html/content -p 3000:80 cjy0526/files:v1
```

![DockerOperation](/img/DockerOperation.png)

![web](/img/web.png)





如果想自行编译这个镜像的话，请把这个项目克隆到本地并运行：

```
docker build -t files:v1 .
docker run -d --name files -v /root/content:/var/www/html/content -p 3000:80 files:v1
```



### 0.3.1版本更新

Files 0.3.1 更新了文件的上传、删除、重命名、新增 和 文件夹的新增、重命名 以及 以zip打包下载所有的文件

在这个容器中，可以通过访问`/fileadmin.php`登录后台管理文件。默认用户名：fileadmin，默认密码：fileadmin,最大文件上传容量：5000M

![](C:/Users/Cobra/Desktop/files/img/default.png)

![](C:/Users/Cobra/Desktop/files/img/login.png)

![](C:/Users/Cobra/Desktop/files/img/admin.png)



```
docker run -d --name files -v /root/content:/var/www/html/content -p 3000:80 cjy0526/files:v2
```



如果你想更改默认的用户名、密码、最大文件上传容量，克隆这个项目编辑Dockerfile并且自行编译镜像