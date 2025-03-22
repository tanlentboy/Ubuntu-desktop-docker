# Ubuntu Desktop Docker 镜像
基于Ubuntu Jammy (22.04) 的 KasmWeb 定制Ubuntu 22.04 桌面版 Docker 镜像,使用浏览器访问远程的Ubuntu desktop,提供完整的 Web 远程桌面体验。

## 特性

- 基于 Ubuntu 22.04 (Jammy)
- 使用 KasmWeb 提供 Web VNC 访问
- 预装常用软件：
  - Google Chrome
  - Visual Studio Code
  - qBittorrent 下载工具
  - 各类压缩工具支持（zip, rar, 7z）

## 快速开始

### 构建镜像

```bash
docker build -t your-username/ubuntu-desktop .
```

### 运行容器

```bash
docker run -d --name desktop \
    --shm-size=512m \
    -p 6901:6901 \
    -e VNC_PW=123456 \
    -v /data:/home/kasm-user/shared \
    your-username/ubuntu-desktop
```

### 访问桌面

通过浏览器访问：
   - 地址：`https://your-ip:6901`
   - 密码：`123456`

## 数据持久化

容器的 `/home/kasm-user` 目录已映射到主机的 `/data` 目录，所有需要保存的文件都应该保存在这个目录下。

## 预装软件说明

### 开发工具
- Visual Studio Code
- Google Chrome

### 下载工具
- qBittorrent

### 压缩工具支持
- zip/unzip
- rar/unrar
- 7zip

## 注意事项

1. 首次访问时浏览器可能会显示证书警告，这是正常的，因为使用了自签名证书
2. 为了安全考虑，建议修改默认密码
3. 建议使用浏览器访问，提供更好的使用体验
4. 容器默认使用 512MB 共享内存，如需调整可修改 `--shm-size` 参数

## 自定义配置

### 修改 VNC 密码
```bash
docker run -d --name desktop \
    -e VNC_PW=your-password \
    ...
```

### 修改分辨率
```bash
docker run -d --name desktop \
    -e VNC_RESOLUTION=1920x1080 \
    ...
```

## 问题排查

1. 如果无法访问，检查防火墙是否允许 6901 端口
2. 如果显示卡顿，可以适当增加 `--shm-size` 的值
3. 如果需要持久化更多目录，可以添加额外的 `-v` 参数


## 引用
colin-chang/ubuntu-desktop
