# uni-app

* 全局安装
```sh
npm install -g @vue/cli@4
```
* 创建正式版uni-app
```sh
vue create -p dcloudio/uni-preset-vue my-project
```
* 创建alpha版uni-app
```sh
vue create -p dcloudio/uni-preset-vue#alpha my-alpha-project
```
* 使用Vue3/Vite版
```sh
npx degit dcloudio/uni-preset-vue#vite my-vue3-project
npx degit dcloudio/uni-preset-vue#vite-ts my-vue3-project
```
* uni-app模板托管在云端的仓库地址，以 GitHub 为例，地址格式为 userName/repositoryName，如 dcloudio/uni-template-picture 就是下载图片模板
* Github无法访问尝试一下措施
  * 更换网络重试，比如使用 4g 网络
  * 在设备或路由器的网络设置中增加 DNS（如：8.8.8.8）
  * 在设备中增加固定的 hosts（如：140.82.113.4 github.com）
* 运行、发布uni-app
```sh
npm run dev:%PLATFORM%
npm run build:%PLATFORM%
```
  * %PLATFORM% 可取值如下：
    * app-plusapp平台生成打包资源（支持npm run build:app-plus ，可用于持续集成。不支持run，运行调试仍需在HBuilderX中操作）
    * h5H5
    * mp-alipay支付宝小程序
    * mp-baidu百度小程序
    * mp-weixin微ä            ¡小程序
    * mp-toutiao字节跳动小程序
    * mp-lark飞书小程序
    * mp-     qqqq 小程序
    * mp-360360 小程序
    * mp-kuaishou快手小程序
    * mp-jd               京东小程序
    * mp-xhs小红书小程序
    * quickapp-webview快应用(we       bview)
    * quickapp-webview-union快应用联盟
    * quickapp-webview-huaweiå¿«应用华为
* uni，读 you ni，是统一的意思    
* 开发规范参考：[Vue 单文件组件 (SFC) 规范](https://vue-loader.vuejs.org/zh/spec.html)
