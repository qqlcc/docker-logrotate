# docker-logrotate  

一个可以自由配置的logrotate，可以在容器启动前自定义一些脚本来创建用户、修改目录权限等操作，还可以完全自定义的配置logrotate规则。

## 构建  
```bash
git clone https://github.com/qqlcc/docker-logrotate.git
cd docker-logrotate
docker build -t your_repository/logrotate:r0.0.1 .
docker push your_repository/logrotate:r0.0.1
```

## 部署  
你可以使用sample作为配置，也可以自己创建一个配置，你可以将你的自定义脚本放在scripts目录下
### 创建配置文件
```bash
cp logrotate-sample.conf logrotate.conf #复制并修改logrotate配置
kubectl create configmap logrotate-scripts --from-file scripts
kubectl create configmap logrotate-conf --from-file logrotate.conf
```
### 部署logrotate  
```bash
kubectl apply -f deployment-sample.yml
```