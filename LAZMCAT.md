# Cockpit Tools - 懒猫微服应用

本目录包含将 Cockpit Tools 打包为懒猫微服 (Lazycat MicroServer) 应用所需的配置文件。

## 文件说明

- `lzc-build.yml` - 构建配置，定义如何打包 LPK 文件
- `lzc-manifest.yml` - 应用清单，定义路由、服务和元数据
- `build.sh` - 构建脚本，执行前端构建
- `lzc-icon.png` - 应用图标（需自行准备，正方形 PNG，200KB 以内）

## 前置要求

1. 安装懒猫微服 CLI 工具 (`lzc-cli`)
2. Node.js 18+ 和 npm 9+
3. 应用图标 `lzc-icon.png`（正方形，PNG 格式，≤200KB）

## 构建步骤

### 1. 准备应用图标

准备一张正方形 PNG 图片作为应用图标，命名为 `lzc-icon.png` 并放在项目根目录。

```bash
# 图标要求：
# - 格式：PNG
# - 比例：1:1（正方形）
# - 大小：≤200KB
# - 建议尺寸：512x512 或 1024x1024
```

### 2. 构建 LPK 包

在项目根目录执行：

```bash
lzc-cli project build -o release/cockpit-tools.lpk
```

构建过程：
1. 执行 `build.sh` 安装依赖并构建前端
2. Vite 编译生成 `dist` 目录
3. 将 `dist` 内容和清单文件打包为 `.lpk` 文件
4. 输出到 `release/cockpit-tools.lpk`

### 3. 安装应用

```bash
lzc-cli app install release/cockpit-tools.lpk
```

### 4. 访问应用

安装完成后，通过以下地址访问：

```
http://cockpit.<微服域名>
```

## 调试

### 查看应用状态

```bash
# 查看已安装的应用列表
lzc-cli app list

# 查看应用运行状态
lzc-cli docker ps | grep cockpit
```

### 查看应用日志

```bash
lzc-cli docker logs -f --tail 100 <container_name>
```

### 进入容器调试

```bash
lzc-cli docker exec -it <container_name> sh
```

## 卸载

```bash
lzc-cli app uninstall cloud.lazycat.app.cockpit-tools
```

## 注意事项

1. **图标文件**：`lzc-icon.png` 未包含在 Git 中，需要自行准备
2. **构建产物**：生成的 `.lpk` 文件已添加到 `.gitignore`
3. **端口配置**：应用使用 Nginx 80 端口提供静态资源服务
4. **持久化**：当前配置为纯静态应用，无需持久化存储

## 技术架构

- **前端框架**：React 19 + Vite 7
- **Web 服务器**：Nginx (alpine)
- **路由模式**：子域名路由 (`cockpit.<微服域名>`)

## 版本

当前应用版本：0.13.0
