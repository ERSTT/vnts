### Switch Language
To switch between languages, change the configuration below:
- For **Chinese**: `/zh`  
- For **English**: `/en`
---
### Language
- [中文](#快速开始)
- [English](#Quick Start)
# 快速开始

### 使用 Docker CLI 部署

运行以下命令启动 VNTS 容器：

```bash
docker run -d \
  --name vnts \
  --restart always \
  -p 29870:29870 \
  -p 29872:29872 \
  -p 29872:29872/udp \
  erstt/vnts:latest \
  -p 29872 -w 1234 -g 10.10.0.1 -f -m 255.255.255.0 --log-path /dev/null
```
### 使用 Docker Compose 部署
创建一个 docker-compose.yml 文件，并添加以下内容：

```yaml
services:
  vnts:
    container_name: vnts
    restart: always
    ports:
      - 29870:29870
      - 29872:29872
      - 29872:29872/udp
    command: > 
      -p 29872 -w 1234 -g 10.10.0.1 -f -m 255.255.255.0 --log-path /dev/null
    image: erstt/vnts:latest
```

### 配置选项
| 参数                      | 描述                                                                                      | 示例                         |
|---------------------------|-------------------------------------------------------------------------------------------|------------------------------|
| `-p, --port <PORT>`        | 指定端口，默认值为 `29872`                                                                | `-p 29872`                   |
| `-w, --white-token <TOKEN>`| Token 白名单，可多次指定                                                                   | `-w 123 -w 1234`            |
| `-g, --gateway <GATEWAY>`  | 指定网关                                                                                  | `-g 10.10.0.1`               |
| `-m, --netmask <NETMASK>`  | 指定子网掩码                                                                               | `-m 255.255.255.0`           |
| `-f, --finger`             | 启用指纹校验，增强安全性（会影响性能）                                                    | `-f`                         |
| `-l, --log-path <PATH>`    | 设置日志输出路径，`/dev/null` 表示不输出日志                                               | `--log-path /dev/null`       |
| `--wg <WG_SECRET_KEY>`     | 设置 WireGuard 私钥（Base64 编码）                                                        | `--wg YOUR_SECRET_KEY`       |
| `-h, --help`               | 显示帮助信息                                                                                |                              |
| `-V, --version`            | 显示版本信息                                                                                |                              |

---

# Quick Start

### Using Docker CLI to Deploy

Run the following command to start the VNTS container:

```bash
docker run -d \
  --name vnts \
  --restart always \
  -p 29870:29870 \
  -p 29872:29872 \
  -p 29872:29872/udp \
  erstt/vnts:latest \
  -p 29872 -w 1234 -g 10.10.0.1 -f -m 255.255.255.0 --log-path /dev/null
```

### Using Docker Compose to Deploy

Create a docker-compose.yml file and add the following content:

```yaml
services:
  vnts:
    container_name: vnts
    restart: always
    ports:
      - 29870:29870
      - 29872:29872
      - 29872:29872/udp
    command: > 
      -p 29872 -w 1234 -g 10.10.0.1 -f -m 255.255.255.0 --log-path /dev/null
    image: erstt/vnts:latest
```

### Configuration Options
| Option                      | Description                                                                                      | Example                         |
|-----------------------------|--------------------------------------------------------------------------------------------------|---------------------------------|
| `-p, --port <PORT>`          | Specify the port, default is `29872`                                                              | `-p 29872`                      |
| `-w, --white-token <TOKEN>`  | Token whitelist, can be specified multiple times                                                  | `-w 123 -w 1234`                |
| `-g, --gateway <GATEWAY>`    | Specify the gateway                                                                               | `-g 10.10.0.1`                  |
| `-m, --netmask <NETMASK>`    | Specify the subnet mask                                                                            | `-m 255.255.255.0`              |
| `-f, --finger`               | Enable fingerprint verification for enhanced security (may impact performance)                    | `-f`                            |
| `-l, --log-path <PATH>`      | Set the log output path, `/dev/null` to disable logging                                            | `--log-path /dev/null`          |
| `--wg <WG_SECRET_KEY>`       | Set WireGuard private key (Base64 encoded)                                                         | `--wg YOUR_SECRET_KEY`          |
| `-h, --help`                 | Show help information                                                                              |                                 |
| `-V, --version`              | Show version information                                                                           |                                 |

---

# VNTS Official Repository

You can find more information on the official VNTS repository:  
[VNTS GitHub Repository](https://github.com/vnt-dev/vnts)

