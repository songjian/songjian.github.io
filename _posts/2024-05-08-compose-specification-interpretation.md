---
layout: post
title: Compose 规范解读（未完待续。。。）
date: 2024-05-08 15:09:00 +0800
---
> Compose 规范的 GitHub 仓库：https://github.com/compose-spec/compose-spec
> 
> Docker Compose 文档：https://docs.docker.com/compose/compose-file/

## 关于 Compose Specification

Compose Specification 是 Docker Compose 的开源规范，它定义了如何使用 YAML 文件来描述多容器应用。这个规范是 Docker Compose 的基础，但也被其他工具如 AWS ECS CLI、Podman Compose 等采用。

大体来说就是Docker Compose 不仅 Docker 使用，Podman、K8s还有各家云服务商也使用，所以需要有一个规范指导各家来实现自己的 Compose ，让 Compose 可以在各家服务上通用。

## 顶层元素 top-level elements

### version 顶层元素（过时了）

原先 docker-compose.yml 文件的开头一般是

```yaml
version: '3'
services:
  web:
    image: nginx:alpine
    ports:
      - "80:80"
```

现在不需要了，如果写了会收到一个警告，警告内容是告诉你 version 属性已经过时。

### name 顶层元素

```yaml
name: myapp

services:
  foo:
    image: busybox
    command: echo "I'm running ${COMPOSE_PROJECT_NAME}"
```

name 属性可以作为项目名称，会当作容器的环境变量${COMPOSE_PROJECT_NAME}传入。如果不定义默认是 compose yml 所在目录的目录名。

### services 顶层元素

#### annotations 注释

annotations 为容器定义注解。annotations 可以使用数组或映射。

annotations 主要是 Kubernetes 使用，Docker 使用 labels 可以实现类似的效果。

#### attach 属性

Docker Compose 版本 2.20.0 中新加入的属性。

attach 设置为 false 时，Compose 不会收集服务的日志，默认 attach 值为 true 。

#### blkio_config

blkio_config 定义了一组配置选项，用于为服务设置块 IO 限制。

```yaml
services:
  foo:
    image: busybox
    blkio_config:
       weight: 300
       weight_device:
         - path: /dev/sda
           weight: 400
       device_read_bps:
         - path: /dev/sdb
           rate: '12mb'
       device_read_iops:
         - path: /dev/sdb
           rate: 120
       device_write_bps:
         - path: /dev/sdb
           rate: '1024k'
       device_write_iops:
         - path: /dev/sdb
           rate: 30
```

##### device_read_bps, device_write_bps

为给定设备的读/写操作设置每秒字节数的限制。

列表中必须有两个键：

* path: 定义受影响设备的符号路径。
* rate: 作为表示字节数的整数值，或作为表示字节值的字符串。

##### device_read_iops, device_write_iops

为给定设备的读/写操作设置每秒操作数的限制。列表中的每个项目必须有两个键：

* path: 定义受影响设备的符号路径。
* rate: 作为表示每秒允许的操作数的整数值。

##### weight

修改相对于其他服务分配给服务的带宽比例。取一个介于 10 和 1000 之间的整数值，500 是默认值。 

##### weight_device

通过设备微调带宽分配。列表中的每个项目必须有两个键：

* path: 定义受影响设备的符号路径。
* weight: 一个介于 10 和 1000 之间的整数值。

#### cpu_count

cpu_count 定义服务容器可用的 CPU 数量。

#### cpu_percent

cpu_percent 定义可用 CPU 的可用百分比。

#### cpu_shares

cpu_shares 以整数值定义服务容器相对于其他容器的 CPU 权重。

#### cpu_period

cpu_period 在基于 Linux 内核的平台上配置 CPU CFS（完全公平调度器）周期。

#### cpu_quota

cpu_quota 在基于 Linux 内核的平台上配置 CPU CFS（完全公平调度器）配额。

#### cpu_rt_runtime

cpu_rt_runtime 配置支持实时调度器的平台的 CPU 分配参数。它可以是使用微秒为单位的整数值，也可以是持续时间。

```yaml
cpu_rt_runtime: '400ms'
cpu_rt_runtime: 95000`
```

#### cpu_rt_period

cpu_rt_period 配置支持实时调度器的平台的 CPU 分配参数。它可以是使用微秒为单位的整数值，也可以是持续时间。

```yaml
cpu_rt_period: '1400us'
cpu_rt_period: 11000`
```

#### cpus

cpus 定义分配给服务容器的（可能是虚拟的）CPU 数量。这是一个小数。0.000 表示无限制。

设置时，cpus 必须与 Deploy Specification 中的 cpus 属性一致。

#### cpuset

cpuset 定义允许执行的显式 CPU。可以是范围 0-3 或列表 0,1。
