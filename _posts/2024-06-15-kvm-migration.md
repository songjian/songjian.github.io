---
layout: post
title: "KVM的虚拟机冷迁移"
---
冷迁移，也被称为离线迁移，是指在虚拟机关闭的情况下将其从一个主机迁移到另一个主机的过程。

```bash
# 在源主机上
virsh dumpxml win11 > win11.xml
virsh shutdown win11
scp win11.xml root@192.168.0.2:/root/
scp /var/lib/libvirt/images/win11.qcow2 root@192.168.0.2:/var/lib/libvirt/images/

# 在目标主机上
virsh define /root/win11.xml
```
