import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart' as fluwx;

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
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

  await GetStorage.init();

  if (Platform.isAndroid) {
    // 设置android状态栏为透明的沉浸，在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //状态栏的颜色根据需要更改
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
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
