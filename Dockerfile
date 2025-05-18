FROM node:18-alpine

# 安装vnstat和其他依赖
RUN apk add --no-cache vnstat curl

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock.json
COPY package*.json ./

# 安装依赖
RUN npm install --production

# 复制项目文件
COPY . .

# 创建vnstat数据目录
RUN mkdir -p /var/lib/vnstat

# 暴露端口
EXPOSE 10089

# 启动命令
CMD ["sh", "-c", "vnstatd -d && node server.js"] 