import 'package:f_pushdeer/app/data/models/message_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

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
          return messageCard(item);
        })));
  }

  Widget messageCard(Messages item) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                '${item.pushkeyName}  ${item.createdAt}',
              ),
            ),
            MarkdownBody(data: item.text ?? ''),
          ],
        ),
      ),
    );
  }
}
