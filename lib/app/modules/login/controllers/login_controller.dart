import 'package:f_pushdeer/app/data/api/home_api.dart';
import 'package:f_pushdeer/app/data/models/base_res.dart';
import 'package:get/get.dart';

import 'package:fluwx_no_pay/fluwx_no_pay.dart' as fluwx;

import '../../../data/models/models.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final provider = Get.find<HomeProvider>();

  @override
  void onInit() {
    super.onInit();
    wxInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void wxInit() {
    fluwx.weChatResponseEventHandler.distinct((a, b) => a == b).listen((res) {
      if (res is fluwx.WeChatAuthResponse) {
        int? errCode = res.errCode;
        print('111111111$errCode');
        if (errCode == 0) {
          String? code = res.code;
          //把微信登录返回的code传给后台，剩下的事就交给后台处理

        } else if (errCode == -4) {
        } else if (errCode == -2) {}
      }
    });
  }

  devJump() async {
    final Response<BaseResponse> res = await provider.loginFake();
    LoginFake body = LoginFake.fromJson(res.body?.content);
    final Response<BaseResponse> res2 =
        await provider.userInfo(body.token ?? '');
    print('loginFake${res.body?.content},,${res2.body?.content}');
  }

  voidJump() {
    fluwx
        .sendWeChatAuth(scope: "snsapi_userinfo", state: "wechat_sdk_demo_test")
        .then((data) {
      if (!data) {
        Get.snackbar('错误', '没有安装微信，请安装微信后使用该功能');
      }
      Get.snackbar('wx', '微信登录：$data');
    });
  }
}
