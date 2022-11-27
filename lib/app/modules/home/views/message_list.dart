import 'package:f_pushdeer/app/data/models/message_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class MessageList extends GetView<HomeController> {
  const MessageList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: controller.messages.length,
        itemBuilder: ((context, index) {
          final item = controller.messages[index];
          return Text('data${item.text}, time${item.createdAt}');
        })));
  }
}
