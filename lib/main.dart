import 'package:flutter/material.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart' as fluwx;

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  _initFluwx() async {
    // await Fluwx.registerWxApi(
    //   appId: "APPID",     //传入注册的应用id
    //   doOnAndroid: true,  //在android上运行
    //   doOnIOS: true,      // 在ios上运行
    // );
    print("这里进来了吗？");

    bool result = await fluwx.registerWxApi(
        appId: "wx3ae07931d0555a24",
        universalLink: "https://test-apple-app-site.3irobotix.net/app/Pawtis");
    print("微信注册结果：${result.toString()}");
    var isInstall = await fluwx.isWeChatInstalled;
    print("微信安装结果：${isInstall.toString()}");
  }

  runApp(GetMaterialApp(
    title: "Application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    onInit: (() async {
      await _initFluwx();
    }),
  ));
}
