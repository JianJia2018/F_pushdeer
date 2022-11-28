import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.devJump();
                },
                child: const Text(
                  '开发登录',
                )),
            ElevatedButton(
                onPressed: () {
                  controller.voidJump();
                },
                child: const Text(
                  '微信登录',
                )),
            ElevatedButton(
                onPressed: () {
                  controller.voidJump();
                },
                child: const Text(
                  'simple_token登录',
                )),
          ],
        ),
      ),
    );
  }
}
