<pre>
**VMware Workstation** 产品允许用户将 Linux、Windows 等多个操作系统作为虚拟机在单台 PC 上运行。用户可以在虚拟机上重现服务器、桌面和平板电脑环境，无需重新启动即可跨不同操作系统同时运行应用。Workstation 还提供隔离的安全环境，用于评估新的操作系统（如 Windows 10）、测试软件应用和补丁程序以及参考体系结构。

借助 Workstation 产品，可以仅从一台本地 PC 轻松测试几乎任何操作系统和应用。构建面向 Windows 10 的应用、使用任何浏览器测试兼容性，或者在无需使用移动设备的情况下部署 Android-x86 以查看移动设备行为。

官方网站：www.vmware.com

**功能特性：**

* 巨型虚拟机 创建拥有多达 16 个虚拟 CPU、8 TB 虚拟磁盘以及 64 GB 内存的大规模虚拟机，以便在虚拟环境中运行要求最严苛的桌面和服务器应用。通过为虚拟机分配多达 2 GB 的显存，可以进一步提升图形密集型应用的处理能力。
* 高性能 3D 图形 VMware Workstation 产品现在支持 DirectX 10 和 OpenGL 3.3，可在运行 3D 应用时提供更顺畅和响应速度更快的体验。Workstation 能够在虚拟机中以接近本机的性能运行 AutoCAD 或 SOLIDWORKS 等要求最为严苛的 3D 应用。
* 支持高分辨率显示屏 Workstation 已经过优化，可以支持用于台式机的高分辨率 4K UHD (3840 x 2160) 显示屏，以及用于笔记本电脑和 x86 平板电脑的 QHD+ (3200×1800) 显示屏。Workstation 还支持具有不同 DPI 设置的多个显示器，例如，可以同时使用全新的 4K UHD 显示屏和您现有的 1080P HD 显示屏。
* 强大的网络连接功能 可使用真实的路由软件和工具，为虚拟机创建复杂的 IPv4 或 IPv6 虚拟网络，或通过与第三方软件集成来设计完整的数据中心拓扑。
* 限制对虚拟机的访问 通过限制对 Workstation 虚拟机设置（例如拖放、复制和粘贴以及连接 USB 设备）的访问来保护公司内容。可对虚拟机进行加密和密码保护，从而确保只有经过授权的用户才能进行访问。
* 交叉兼容性 利用 Workstation，您可以创建能够跨 VMware 产品组合运行的虚拟机，也可以创建在 Horizon FLEX 中使用的受限虚拟机。我们甚至还支持开放标准，使您不仅可以创建虚拟机，还可以使用来自其他供应商的虚拟机。
* 共享虚拟机 在模拟生产环境中快速共享和测试应用。将 VMware Workstation Pro 作为一个服务器运行，以便与您的团队成员、部门或组织共享具有各种所需配置的预加载虚拟机的存储库。

**更新日志：**

<https://docs.vmware.com/cn/VMware-Workstation-Pro/15/rn/workstation-15-release-notes.html>

**系统要求**

支持使用 2011 年或更晚发布的处理器 (CPU) 的系统，但以下系统**除外**：

* 使用基于 2011 年 Bonnell 微架构的 Intel Atom 处理器的系统。例如，Atom Z670/Z650 和 Atom N570。
* 使用基于 2012 年 Saltwell 微架构的 Intel Atom 处理器的系统。例如，Atom S1200、Atom D2700/D2500 和 Atom N2800/N2600。
* 使用基于 Llano 和 Bobcat 微架构的 AMD 处理器的系统。例如，代号为 Hondo、Ontario、Zacate 和 Llano 的处理器。

此外，还**支持**以下系统：使用基于 2010 年 Westmere 微架构的 Intel 处理器的系统。例如，Xeon 5600、Xeon 3600、Core i7-970、Core i7-980 和 Core i7-990。

**新增功能**

Workstation 15 Pro 中新增了以下支持：

* **支持新的客户机操作系统**


* Windows 10 1803
* Ubuntu 18.04
* Fedora 28
* RHEL 7.5
* CentOS 7.5
* Debian 9.5
* OpenSuse Leap 15.0
* FreeBSD 11.2
* ESXi 6.7


* **DirectX 10.1** DirectX 10.1 是 DirectX 10.0 的增量更新。它通过支持多重采样抗锯齿 (MSAA) 功能提供了更高的视觉质量。DirectX 10.1 还支持 Shader Model 4.1 和 Cubemap Array。
* **硬件版本 16**


* 支持 DirectX 10.1
* 最大 3 GB 的图形内存


* **REST API** 可以使用 Workstation RESTful API，通过标准 JSON over HTTP/HTTPS 自动完成常见虚拟机任务。支持以下虚拟机操作：


* 管理虚拟机清单
* 管理虚拟机电源
* 克隆虚拟机
* 管理网络连接


* **支持高 DPI** 高 DPI 相关功能要求主机和虚拟机的操作系统为 Windows 10 版本 1703 或更高版本。


* **支持主机级别高 DPI** – Workstation 界面会自动检测主机级别的 DPI 更改，并自动调整布局以符合新 DPI。
* **客户机 DPI 与主机同步** – 主机端发生 DPI 更改时，客户机操作系统会调整其 DPI 以便与主机 DPI 相匹配。 此功能需要使用 VMware Tools 10.3.2。


* **连接到 vCenter 时的“主机和群集”视图** 连接到远程 vSphere 时，Workstation 15 Pro 新增了“主机和群集”视图。现在，清单树采用两个不同的视图显示对象的层次结构排列：“主机和群集”视图以及“虚拟机”视图。您只需单击一次，即可在这两个视图之间轻松切换。这是仅限 Windows 主机的功能。
* **支持 vSphere 6.7** Workstation 15 Pro 提供了对 vSphere 6.7 的无缝支持。您可以从 Workstation 15 Pro 连接到远程 ESXi 6.7 主机或 vCenter Server 6.7，以管理在 vSphere 上运行的远程虚拟机。您还可以将本地虚拟机上载到 vSphere 6.7，或将 vSphere 6.7 上运行的远程虚拟机下载到本地桌面。您也可以部署 VMware VCSA 6.7 (vCenter Server Appliance) OVA 软件包，以在 Workstation 15 Pro 上运行。
* **USB 自动连接到虚拟机** 将 Workstation 15 Pro 配置为记住连接规则后，USB 设备可以自动连接到已打开电源的虚拟机。这是仅限 Windows 主机的功能。
* **通过 SSH 登录到 Linux 虚拟机** 现在，您可以使用 Workstation 15 Pro 提供的 SSH 访问 Linux 虚拟机。 此功能要求主机的操作系统为 Windows 10 版本 1803 或更高版本。
* **增强了用户体验**


* **拉伸客户机显示** 为 Linux 客户机和早于 Windows XP 的 Windows 客户机启用了拉伸客户机显示功能。您可以使用“保持纵横比拉伸”功能在保持用户界面纵横比的同时拉伸虚拟机显示，或者还可以使用“自由拉伸”功能拉伸虚拟机显示以填充用户界面。这是仅限 Windows 主机的功能。
* **打开虚拟机目录** 现在，可以轻松地从 Windows 主机中访问虚拟机目录，方法是右键单击 Workstation Pro 库中的虚拟机，然后选择**打开虚拟机目录**。Linux Workstation Pro 已支持此功能。


* **支持 Linux 主机 Wayland** 现在，Workstation 15 Pro 可以在 Linux 主机 Wayland 桌面上运行。要在 Wayland 桌面上安装 Workstation Pro，必须使用终端模式安装。
* **改进了虚拟 NVMe 存储的性能**

**已解决的问题**

* **直接使用物理磁盘的虚拟机可能会显示黑屏**如果虚拟机直接使用物理磁盘，在打开虚拟机电源后，虚拟机可能会显示黑屏。这个问题已得到解决。
* **如果将并行端口映射到物理并行端口，在打开虚拟机电源后，虚拟机可能会崩溃并显示错误**如果虚拟机使用并行端口，并且该并行端口映射到主机操作系统的物理并行端口，在打开虚拟机电源后，虚拟机可能会崩溃并显示以下错误：不可恢复的 VMware Workstation 错误: (vcpu-0) (VMware Workstation unrecoverable error: (vcpu-0))这个问题已得到解决。
* **连接到 DELL Thunderbolt USB Dock 的 USB 设备可能无法连接到虚拟机**将 USB 设备连接到 USB Dock（例如，DELL Thunderbolt）后，USB 设备可能无法连接到虚拟机。这个问题已得到解决。
* **无法在 Windows 主机上直接访问连接到某些 3.1 xHCI 控制器的 USB 设备**在 Windows 主机上，选择**虚拟机** > **可移动设备**时，未列出连接到某些 USB 3.1 控制器的 USB 设备。因此，无法从虚拟机直接访问这些设备。这个问题已得到解决。
* **在 Linux 主机上使用“缩放”实用工具时，Workstation Pro 界面可能会崩溃**对于某些 Linux 主机（例如 Ubuntu 18.04），当您使用“缩放”实用工具时，Workstation Pro 界面可能会崩溃。这个问题已得到解决。

**已知问题**

* **在主机上安装某个第三方软件后，虚拟机中的鼠标单击功能可能停止工作**在主机上安装某个软件（例如 WizMouse）后，虚拟机中的鼠标单击功能可能停止工作。**解决办法**：

1. 关闭虚拟机电源。
2. 将以下条目添加到虚拟机的 .vmx 文件中： mks.win32.processWin32MouseInput = "TRUE"
3. 打开虚拟机电源。

**激活密钥：**

ZC10K-8EF57-084QZ-VXYXE-ZF2XF

UF71K-2TW5J-M88QZ-8WMNT-WKUY4

AZ7MK-44Y1J-H819Z-WMYNC-N7ATF

CU702-DRD1M-H89GP-JFW5E-YL8X6

YY5EA-00XDJ-480RP-35QQV-XY8F6

VA510-23F57-M85PY-7FN7C-MCRG0

**下载地址：**

[Workstation 15 Pro for Windows](https://www.vmware.com/go/getworkstation-win)

[Workstation 15 Pro for Linux](https://www.vmware.com/go/getworkstation-linux)

</pre>

来自 <https://cloud.tencent.com/developer/article/1430711>

 
