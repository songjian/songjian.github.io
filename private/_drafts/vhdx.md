# 将win11开发环境装入vhdx

## 必要条件

- [ ] Windows 10 的本机启动需要 .vhdx 格式，而不是 .vhd 格式

## 开始

0. `diskpart`
0. `create vdisk file=C:\windows.vhdx maximum=25600 type=fixed`
0. `attach vdisk`


git仓库： https://gogs.betterhr.cn/sj/windows-development-environment-vhdx

优点：
	• 把熟悉的工作环境带在身边
	• 快速恢复到熟悉的工作环境
	• 快速重装系统
	• 破除Win11的安装限制（TPM2.0和CPU限制）
	• 最新版的系统，跟上时代的脚步

痛点：
	• 每次重装系统都是一次痛苦的经历，安装常用软件、配置语言开发环境，为了减小重装系统带来的痛苦，所以想到将开发环境放入vhdx中，只要把制作好的vhdx文件放入外置存储设备（U盘、移动硬盘）或拷贝到电脑硬盘上，就能快速获得熟悉的开发环境。
	• 本项目是帮助使用Windows作为开发环境的程序员配置开发环境，本项目可以在正式项目的开发环境中使用，也可以作为熟悉Windows下开发环境，为准备自己搭建开发环境的热身环境使用。本环境使用vhdx发布，可以运行在虚拟中，不过更推荐将vhdx加入启动菜单







	1. dism释放映像到磁盘分区
	2. 设置win引导
	3. 加入Windows预览体验计划（Beta）
	4. vscode
	5. 安装powertoys
	6. Amazon kindle



提供vhdx的校验码









基于win11专业版（21H2，操作系统版本22000.348）搭建，加入了开发常用的软件

vhdx为动态*GB，

Windows terminal 设置为看默认终端

特性
* vscode版本：1.62.3
* 加入Windows预览体验计划（Beta）
* 配置了wsl环境（Ubuntu 20.04 LTS）
* 安装了Docker Desktop（版本）❌
* 安装powertoys（v0.49.1版）



制作步骤：
	1. 创建vhdx，动态，最大100gb
		a. create vdisk file=C:\windows11.vhdx maximum=100600 type=Expandable
	2. 附加vhdx
		a. attach vdisk



完美的windows开发环境
	1. windows安装进vhdx，随时拷贝带走
	2. 自建wsl，方便快速工作在自己熟悉的linux环境下


