---
layout: post
title: "开发Cloudflare Pages Functions"
---
创建用于保存 Cloudflare Pages Functions 代码的仓库：

```bash
mkdir try-cloudflare-pages-functions && cd try-cloudflare-pages-functions && \
git init
```

GitHub上创建一个仓库用于保存 Cloudflare Pages Functions 的代码。

在Cloudflare的 Workers & Pages中创建一个 Page Application，创建时使用 Connect to Git，选择刚才创建的仓库。

参考

- [https://developers.cloudflare.com/pages/functions/local-development/](https://developers.cloudflare.com/pages/functions/local-development/)
