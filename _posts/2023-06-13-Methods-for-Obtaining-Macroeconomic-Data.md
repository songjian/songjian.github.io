---
layout: post
title: 获取宏观经济数据的方法
categories: [Python]
tags: [Python, 数据分析, 数据获取]
---

作为一个量化投资爱好者，你可能需要宏观经济数据放入模型中去做分析，但是业余爱好者不太可能花钱买昂贵的商业数据，所以一般会选择免费的平台或者自己写爬虫爬取。

我因为需要宏观经济数据，通过在网上搜索，发现国家统计局（http://www.stats.gov.cn/）的网站是获取宏观数据的比较好的数据源。

通过对网站接口的分析，我把获取数据的方法做成了一个Python包——https://github.com/songjian/cnstats，方便自己也方便其他人使用。

我创建了两个Github仓库，第一个是调用国家统计局网站接口获取数据的Python；第二个是调用第一个Python包的使用示例。

[https://github.com/songjian/cnstats](https://github.com/songjian/cnstats)

[https://github.com/songjian/get-macroeconomic-data-from-stats.gov.cn](https://github.com/songjian/get-macroeconomic-data-from-stats.gov.cn)
