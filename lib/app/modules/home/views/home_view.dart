import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'message_list.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(children: [
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    controller.initDevices();
                  },
                  child: const Text(
                    '注册设备',
                  )),
              ElevatedButton(
                  onPressed: () {
                    controller.pushMessage();
                  },
                  child: const Text(
                    '推送消息',
                  )),
              ElevatedButton(
                  onPressed: () {
                    controller.messageList();
                  },
                  child: const Text(
                    '拉取消息',
                  )),
            ],
          ),
          Expanded(child: MessageList())
        ]),
      ),
    );
  }
}
