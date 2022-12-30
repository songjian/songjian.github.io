---
layout: post
title: redsocks + nftables实现透明代理
categories: nftables
---
OpenWrt 22.03 默认使用 firewall4 做防火墙。redsocks官方给的示例是用 iptables 写的，所以不能直接用到 nftables 上。但是有工具可以把 iptables 规则写法转为 nftables 规则写法。这个工具是 iptables-translate 。

```sh
$ iptables-translate -h
iptables-translate v1.8.7

Usage: iptables-translate -[ACD] chain rule-specification [options]
	iptables-translate -I chain [rulenum] rule-specification [options]
	iptables-translate -R chain rulenum rule-specification [options]
	iptables-translate -D chain rulenum [options]
	iptables-translate -[LS] [chain [rulenum]] [options]
	iptables-translate -[FZ] [chain] [options]
	iptables-translate -[NX] chain
	iptables-translate -E old-chain-name new-chain-name
	iptables-translate -P chain target [options]
	iptables-translate -h (print this help information)

Commands:
Either long or short options are allowed.
  --append  -A chain		Append to chain
  --check   -C chain		Check for the existence of a rule
  --delete  -D chain		Delete matching rule from chain
  --delete  -D chain rulenum
				Delete rule rulenum (1 = first) from chain
  --insert  -I chain [rulenum]
				Insert in chain as rulenum (default 1=first)
  --replace -R chain rulenum
				Replace rule rulenum (1 = first) in chain
  --list    -L [chain [rulenum]]
				List the rules in a chain or all chains
  --list-rules -S [chain [rulenum]]
				Print the rules in a chain or all chains
  --flush   -F [chain]		Delete all rules in  chain or all chains
  --zero    -Z [chain [rulenum]]
				Zero counters in chain or all chains
  --new     -N chain		Create a new user-defined chain
  --delete-chain
	     -X [chain]		Delete a user-defined chain
  --policy  -P chain target
				Change policy on chain to target
  --rename-chain
	     -E old-chain new-chain
				Change chain name, (moving any references)
Options:
    --ipv4	-4		Nothing (line is ignored by ip6tables-restore)
    --ipv6	-6		Error (line is ignored by iptables-restore)
[!] --proto	-p proto	protocol: by number or name, eg. `tcp'
[!] --source	-s address[/mask][...]
				source specification
[!] --destination -d address[/mask][...]
				destination specification
[!] --in-interface -i input name[+]
				network interface name ([+] for wildcard)
 --jump	-j target
				target for rule (may load target extension)
  --goto      -g chain
			       jump to chain with no return
  --match	-m match
				extended match (may load extension)
  --numeric	-n		numeric output of addresses and ports
[!] --out-interface -o output name[+]
				network interface name ([+] for wildcard)
  --table	-t table	table to manipulate (default: `filter')
  --verbose	-v		verbose mode
  --wait	-w [seconds]	maximum wait to acquire xtables lock before give up
  --wait-interval -W [usecs]	wait time to try to acquire xtables lock
				default is 1 second
  --line-numbers		print line numbers when listing
  --exact	-x		expand numbers (display exact values)
[!] --fragment	-f		match second or further fragments only
  --modprobe=<command>		try to insert modules using this command
  --set-counters PKTS BYTES	set the counter during insert/append
[!] --version	-V		print package version.

```

### 使用 iptables-translate 转换 iptables 规则


#### redsocks 官方 iptables 示例

```sh
# Create new chain
root# iptables -t nat -N REDSOCKS

# Ignore LANs and some other reserved addresses.
# See http://en.wikipedia.org/wiki/Reserved_IP_addresses#Reserved_IPv4_addresses
# and http://tools.ietf.org/html/rfc5735 for full list of reserved networks.
root# iptables -t nat -A REDSOCKS -d 0.0.0.0/8 -j RETURN
root# iptables -t nat -A REDSOCKS -d 10.0.0.0/8 -j RETURN
root# iptables -t nat -A REDSOCKS -d 100.64.0.0/10 -j RETURN
root# iptables -t nat -A REDSOCKS -d 127.0.0.0/8 -j RETURN
root# iptables -t nat -A REDSOCKS -d 169.254.0.0/16 -j RETURN
root# iptables -t nat -A REDSOCKS -d 172.16.0.0/12 -j RETURN
root# iptables -t nat -A REDSOCKS -d 192.168.0.0/16 -j RETURN
root# iptables -t nat -A REDSOCKS -d 198.18.0.0/15 -j RETURN
root# iptables -t nat -A REDSOCKS -d 224.0.0.0/4 -j RETURN
root# iptables -t nat -A REDSOCKS -d 240.0.0.0/4 -j RETURN

# Anything else should be redirected to port 12345
root# iptables -t nat -A REDSOCKS -p tcp -j REDIRECT --to-ports 12345

# Any tcp connection made by `luser' should be redirected.
root# iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner luser -j REDSOCKS

# You can also control that in more precise way using `gid-owner` from
# iptables.
root# groupadd socksified
root# usermod --append --groups socksified luser
root# iptables -t nat -A OUTPUT -p tcp -m owner --gid-owner socksified -j REDSOCKS

# Now you can launch your specific application with GID `socksified` and it
# will be... socksified. See following commands (numbers may vary).
# Note: you may have to relogin to apply `usermod` changes.
luser$ id
uid=1000(luser) gid=1000(luser) groups=1000(luser),1001(socksified)
luser$ sg socksified -c id
uid=1000(luser) gid=1001(socksified) groups=1000(luser),1001(socksified)
luser$ sg socksified -c "firefox"

# If you want to configure socksifying router, you should look at
# doc/iptables-packet-flow.png, doc/iptables-packet-flow-ng.png and
# https://en.wikipedia.org/wiki/File:Netfilter-packet-flow.svg
# Note, you should have proper `local_ip' value to get external packets with
# redsocks, default 127.0.0.1 will not go. See iptables(8) manpage regarding
# REDIRECT target for details.
# Depending on your network configuration iptables conf. may be as easy as:
root# iptables -t nat -A PREROUTING --in-interface eth_int -p tcp -j REDSOCKS
```

#### 转换后 nftables 规则

```sh
nft add chain ip nat REDSOCKS
nft add rule ip nat REDSOCKS counter return
nft add rule ip nat REDSOCKS ip daddr 10.0.0.0/8 counter return
nft add rule ip nat REDSOCKS ip daddr 100.64.0.0/10 counter return
nft add rule ip nat REDSOCKS ip daddr 127.0.0.0/8 counter return
nft add rule ip nat REDSOCKS ip daddr 169.254.0.0/16 counter return
```


### 参考

[nftables 简明教程](https://www.hi-linux.com/posts/29206.html)

[第 47 章 nftables 入门](https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/getting-started-with-nftables_configuring-and-managing-networking)

[9.2.4. 将 iptables 转换为 nftables的新工具](https://access.redhat.com/documentation/zh-cn/red_hat_enterprise_linux/8/html/considerations_in_adopting_rhel_8/new_tools_iptables_nftables_networking)

### redsocks

配置文件路径: /etc/redsocks.conf
