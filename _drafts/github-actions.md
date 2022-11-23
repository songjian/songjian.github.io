---
layout: post
title: 学习 Github Actions
categories: Github
date:   2021-12-16 11:25:07 +0800
---
### 参考

* [阮一峰 GitHub Actions 入门教程](http://www.ruanyifeng.com/blog/2019/09/getting-started-with-github-actions.html)
* [Github官网文档 Workflow syntax](https://docs.github.com/en/actions/learn-github-actions/workflow-syntax-for-github-actions)
 

### 资源
* [Github官方的Actions市场](https://github.com/marketplace?type=actions)
* [https://github.com/sdras/awesome-actions](https://github.com/sdras/awesome-actions)
 

### 笔记
* GitHub Actions 是 GitHub 的持续集成服务，于2018年10月推出。
* 大家知道，持续集成由很多操作组成，比如抓取代码、运行测试、登录远程服务器，发布到第三方服务等等。GitHub 把这些操作就称为 actions。
* 很多操作在不同项目里面是类似的，完全可以共享。GitHub 注意到了这一点，想出了一个很妙的点子，允许开发者把每个操作写成独立的脚本文件，存放到代码仓库，使得其他开发者可以引用。
* GitHub 做了一个官方市场，可以搜索到他人提交的 actions。另外，还有一个 awesome actions 的仓库，也可以找到不少 action。
* GitHub Actions 有一些自己的术语：
    * workflow （工作流程）：持续集成一次运行的过程，就是一个 workflow。
    * job （任务）：一个 workflow 由一个或多个 jobs 构成，含义是一次持续集成的运行，可以完成多个任务。
    * step（步骤）：每个 job 由多个 step 构成，一步步完成。
    * action （动作）：每个 step 可以依次执行一个或多个命令（action）。
 
