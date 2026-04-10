# mycli

一个使用 jzero CLI 模板创建的命令行工具演示项目。

## 功能特性

- ✅ 统一配置管理（支持配置文件、环境变量、命令行标志）
- ✅ 多平台支持（Linux、macOS、Windows）
- ✅ 自动化发布（GoReleaser + GitHub Actions）
- ✅ Docker 容器化部署
- ✅ 插件系统支持

## 快速开始

### 安装

```bash
# 使用 go install 安装
go install github.com/jaronnie/mycli@latest

# 或从源码构建
git clone https://github.com/jaronnie/mycli.git
cd mycli
go build
sudo mv mycli /usr/local/bin/
```

### 使用

```bash
# 查看版本
mycli version

# 问候命令（使用默认值）
mycli greet

# 问候命令（指定名字）
mycli greet --name 张三

# 使用环境变量
export MYCLI_GREET_NAME="李四"
mycli greet
```

## 配置管理

### 配置优先级

```
命令行标志 > 环境变量 > 配置文件
```

### 配置方式

**1. 配置文件** (`~/.mycli.yaml`)
```yaml
debug: false
greet:
  name: 世界
```

**2. 环境变量**
```bash
export MYCLI_DEBUG=true
export MYCLI_GREET_NAME="世界"
```

**3. 命令行标志**
```bash
mycli --debug
mycli greet --name "张三"
```

## 开发

### 添加新命令

参考 [jzero CLI 工具编写指南](https://docs.jzero.io/zh-CN/blog/cli-tool-guide/)

### 代码结构

```
mycli/
├── main.go                    # 入口文件
├── internal/
│   ├── command/              # 命令实现
│   │   ├── version/          # 版本命令
│   │   └── greet/            # 问候命令
│   └── config/               # 配置管理
│       └── config.go
├── Dockerfile                 # Docker 配置
├── .goreleaser.yaml          # GoReleaser 配置
├── .github/workflows/        # GitHub Actions
│   └── release.yml
├── go.mod
└── go.sum
```

## 自动化发布

项目配置了完整的自动化发布流程：

1. **GoReleaser** - 多平台二进制文件构建
2. **GitHub Actions** - 自动触发发布
3. **Docker** - 多架构镜像构建

### 发布步骤

```bash
# 创建并推送标签
git tag v1.0.0
git push origin v1.0.0

# GitHub Actions 自动执行：
# - 构建多平台二进制文件
# - 创建 GitHub Release
# - 构建并推送 Docker 镜像
```

### 使用前配置

> ⚠️ **重要**：使用 GitHub Actions 自动发布前，需要在仓库设置中配置权限：
> 
> Settings → Actions → General → Workflow permissions
> 
> 启用 "Read and write permissions"
 
## 许可证

MIT License
