# react-native 银联插件

[银联官方](https://open.unionpay.com/ajweb/product/detail?id=3)

## 安装

```
npm i -S react-native-add-unionpay
react-native link react-native-dbb-unionpay
```

## IOS 配置

-   在工程 info.plist 设置中添加一个 URL Types 回调协议(在 UPPayDemo 工程中使用“UPPayDemo”作为协议)，用于在支付完成后返回商户客户端。
-   http 请求设置: 在 Xcode7.0 之后的版本中进行 http 请求时，需要在工程对应的 plist 文件中添加 NSAppTransportSecurity Dictionary 并同时设置里面 NSAllowsArbitraryLoads 属性值为 YES
-   添加协议白名单: 在 Xcode7.0 之后的版本中进行开发，需要在工程对应的 plist 文件中，添加 LSApplicationQueriesSchemes Array 并加入 uppaysdk、uppaywallet、uppayx1、uppayx2、uppayx3 五个 item
-   AppDelegate.m 的 下面 @end 前面添加下面代码

```m
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
  return [RCTLinkingManager application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}
```

## 调用插件

```
import * as Unionpay from 'react-native-dbb-unionpay'
/*
* tn 交易流水号，商户后台向银联后台提交订单信息后，由银联后台生成并下发给商户后台的交易凭证；
* mode 接入模式，标识商户以何种方式调用支付控件，该参数提供以下两个可选值："00"代表接入生产环境（正式版本需要）；"01"代表接入开发测试环境（测试版本需要）；
*/
Unionpay.startPay(tn, mode)
.then(res => {
	console.log(res, 'see payment res');
})
catch(err => {
	//检查返回的对象有code属性
	if(typeof err == 'object' && err.code) {
		//code 当失败的时候值有：fail,cancel
	}
	console.warn(err, 'payment failed ');
})
```

# 测试账号

以下是测试用卡号、手机号等信息（此类信息仅供测试使用，不会发生真实交易）
[银联官方](https://open.unionpay.com/ajweb/product/detail?id=3)

```
招商银行借记卡：6226090000000048
手机号：18100000000
密码：111101
短信验证码：123456（先点获取验证码之后再输入）
证件类型：01身份证
证件号：510265790128303
姓名：张三
```

```
华夏银行贷记卡：6226388000000095
手机号：18100000000
CVN2：248
有效期：1219
短信验证码：123456（先点获取验证码之后再输入）
证件类型：01身份证
证件号：510265790128303
姓名：张三
```
