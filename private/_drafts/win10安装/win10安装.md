## 安装系统和驱动

1. 下载win10安装文件和制作安装工具
   1. 访问微软的“下载Windows 10”页面  <https://www.microsoft.com/zh-cn/software-download/windows10> ，点击“立即下载工具”。
2. 更新系统
3. 安装驱动
   1. [dell 9020m](https://www.dell.com/support/home/zh-cn/product-support/product/optiplex-9020m-desktop/drivers)
   2. [intel nuc](https://downloadcenter.intel.com/zh-cn)

## 删除无用的软件包

1. OneDrive
2. Skype

## 其他设置

##### 配置Outlook账号

songjian@codeorder.cn

001@codeorder.cn

boss@codeorder.cn

business@codeorder.cn

##### 安装Windows Terminal

开启Hyper-V

管理员身份在PowerShell中执行

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

##### 安装Office

1. 下载 [Office Tool Plus](https://otp.landian.vip/zh-cn/)

##### 安装WSL2

> 安装
>
> 1. 以管理员身份打开PowerShell并运行：dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
> 2. 更新系统，内部版本号必须是18362.1049+或18363.1049+
> 3. 启动虚拟机功能：以管理员身份打开PowerShell并运行 dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
> 4. 重启电脑
> 5. 下载Linux内核更新包：<https://wslstorestorage.blob.core.windows.net/wslblob/wsl>*update*x64.msi
> 6. 将WSL2设置为默认版本：以管理员的身份打开PowerShell并运行 wsl --set-default-version 2
> 7. 安装Linux分发：<https://aka.ms/wslstore>
> 8. 设置新分发：首次启动设置用户名和密码
>
> 管理
>
> wsl发行版设置默认用户
>
> `[发行版] config --default-user <USERNAME>`

##### 安装沙箱（sandbox）

> 安装
>
> 1. 确保你的计算机使用的是 Windows 10 专业版或企业版、内部版本18305或更高版本。
> 2. 在计算机上启用虚拟化。
>    * 如果您使用的是物理计算机，请确保在 BIOS 中启用了虚拟化功能。
>    * 如果你使用的是虚拟机，请运行以下 PowerShell 命令以启用嵌套的虚拟化：\
>      VMProcessor-VMName <VMName> -ExposeVirtualizationExtensions $true
> 3. 使用任务栏上的搜索栏并键入 "打开和关闭 Windows 功能 "，以访问 "Windows 可选功能" 工具。 选择 " Windows 沙盒 "，然后选择 "确定"。 如果出现提示，请重新启动计算机。
>    * 如果 Windows 沙盒 选项不可用，则你的计算机不满足运行 Windows 沙盒的要求。 如果你认为这不正确，请查看必备组件列表以及步骤1和2。
> 4. 在 "开始" 菜单上找到并选择 " Windows 沙盒 " 以首次运行它。
>
> 来自 <<https://docs.microsoft.com/zh-cn/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview>>