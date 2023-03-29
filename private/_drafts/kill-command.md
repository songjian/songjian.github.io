# Kill Command

## 原理

kill 命令的执行原理是这样的，kill 命令会向操作系统内核发送一个信号（多是终止信号）和目标进程的 PID，然后系统内核根据收到的信号类型，对指定进程进行相应的操作。

## 最常用的信号是

* 1 (HUP)：重新加载进程。
* 9 (KILL)：杀死一个进程。
* 15 (TERM)：正常停止一个进程。

## 使用

```sh
# 查看可用的信号
kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
 11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
 16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
 21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
 26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
 31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
 38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
 43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
 48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
 53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
 58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2

# 执行 kill
kill -9 PID

# kill 默认发送 SIGTERM(15)
kill PID
```

## 其他 kill 命令

### killall

Linux killall 用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程。

kill 命令杀死指定进程 PID，需要配合 ps 使用，而 killall 直接对进程对名字进行操作，更加方便。

#### 示例

```sh
# 结束所有 php-fpm 进程
killall -9 php-fpm
```

### pkill

Linux pkill 用于杀死一个进程，与 kill 不同的是它会杀死指定名字的所有进程，类似于 killall 命令。

kill 命令杀死指定进程 PID，需要配合 ps 使用，而 pkill 直接对进程对名字进行操作，更加方便。

#### 示例

```sh
# 结束所有 php-fpm 进程
pkill -9 php-fpm
```
