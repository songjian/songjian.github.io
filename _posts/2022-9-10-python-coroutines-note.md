---
layout: post
title: Python协程笔记
categories: [Python]
tags: [Python, 协程]
---
### 参考

* [Coroutines and Tasks](https://docs.python.org/3/library/asyncio-task.html)
* [理解Python协程(Coroutine)](https://zhuanlan.zhihu.com/p/68043798)

### 笔记

* Python的协程是通过Generator实现的，协程是遵循某些规则的生成器;
* 运行一个协程，`asyncio` 提供三种机制：
  * [asyncio.run()](https://docs.python.org/zh-cn/3/library/asyncio-task.html#asyncio.run)
  * `await` 等待一个协程
  * `asyncio.create_task()` 函数用来并发运行作为 asyncio任务的多个协程
* 一个对象如果可以使用`await`语句，它就是一个可等待对象
* 可等待对象有三种类型
  * 协程
  * [任务](https://docs.python.org/zh-cn/3/library/asyncio-task.html#asyncio.Task)
    * 任务被用来`并行的`调度协程
    * 当一个协程通过 `asyncio.create_task()` 等函数被封装为一个任务，该协程会被自动调度执行
  * [Future](https://docs.python.org/zh-cn/3/library/asyncio-future.html#asyncio.Future)
    * `Future`是一种特殊的`低层级`可等待对象，表示一个异步操作的最终结果。
* 休眠 `coroutine asyncio.sleep(delay, result=None)`
  * 如果指定了`result`，则当协程完成时将其返回给调用者
* 并发运行任务 `awaitable asyncio.gather(*aws, return_exceptions=False)`
  * 并发 运行`aws`序列中的可等待对象。
  * 如果`aws`中某个可等待对象是协程，会自动作为一个任务调度
* `asyncio.gather` 和 `asyncio.wait` 区别
  * `asyncio.gather` 返回一个`list`, 结果和输入协程的顺序一致
  * `asyncio.wait` 返回两个值，第一项表示完成的任务列表 (done)，第二项表示等待 (Future) 完成的任务列表 (pending)
  * `asyncio.wait` 支持一个接收参数return_when，在默认情况下，asyncio.wait会等待全部任务完成 (return_when='ALL_COMPLETED')，它还支持 FIRST_COMPLETED（第一个协程完成就返回）和 FIRST_EXCEPTION（出现第一个异常就返回）
* `asyncio.create_task` 就是用的 `loop.create_task`
