import 'package:f_pushdeer/app/data/api/home_api.dart';
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
      drawer: Drawer(),
      appBar: PreferredSize(
          child: AppBar(
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          ),
          preferredSize: Size.fromHeight(40)),
      body: Container(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 10),
        child: Column(children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //         onPressed: () {
          //          .openDrawer();
          //         },
          //         icon: Icon(Icons.menu)),
          //     IconButton(onPressed: () {}, icon: Icon(Icons.add))
          //   ],
          // ),
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
