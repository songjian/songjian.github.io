# 从vhdx启动系统

## 必要条件

- [ ] Windows 10 的本机启动需要 .vhdx 格式，而不是 .vhd 格式

## 开始

0. `diskpart`
0. `create vdisk file=C:\windows.vhdx maximum=25600 type=fixed`
0. `attach vdisk`
