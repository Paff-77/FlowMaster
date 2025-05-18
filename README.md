### Docker 部署


##### 1. 直接使用 Docker 命令
```bash
# 创建卷用于持久化数据
docker volume create vnstat_data

# 启动容器
docker run -d \
  --name flowmaster \
  --restart always \
  --privileged \
  --network host \
  -p 10089:10089 \
  -v vnstat_data:/var/lib/vnstat \
  sumirepaff/flowmaster:main
```
#### 方法二：Docker Compose

##### 1. 克隆项目

```bash
mkdir FlowMaster
cd FlowMaster
wget https://raw.githubusercontent.com/Paff-77/FlowMaster/refs/heads/main/docker-compose.yml
```

##### 2. 使用 Docker Compose 启动

```bash
docker compose up -d
```

这将自动拉取Docker镜像并在后台启动容器。

#### 3. 访问服务

安装完成后，通过浏览器访问：`http://服务器IP:10089`

> 注意：请确保防火墙已放行 10089 端口

#### 4. 查看容器日志

```bash
docker logs flowmaster
```

#### 5. 停止服务

```bash
docker compose down
```