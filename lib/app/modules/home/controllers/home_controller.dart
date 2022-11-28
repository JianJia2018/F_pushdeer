import 'package:f_pushdeer/app/data/api/home_api.dart';
import 'package:f_pushdeer/app/data/models/base_res.dart';
import 'package:f_pushdeer/app/data/models/device_reg.dart';
import 'package:f_pushdeer/app/data/models/key_gen.dart';
import 'package:f_pushdeer/app/data/models/message_list.dart';
import 'package:f_pushdeer/app/data/models/push_message.dart';
import 'package:f_pushdeer/app/utils/device_id.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();
  //TODO: Implement HomeController
  final provider = Get.put(HomeProvider());

  final devicesId = ''.obs;

  late final messages = <Messages>[].obs;
  @override
  void onInit() {
    super.onInit();

    // initDevices();
    messageList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initDevices() async {
    Device? result = await deviceDetails();
    if (result == null) return;
    devicesId.value = result.deviceId;
    final Response<BaseResponse> res1 = await provider.keyGen();
    KeyGen body1 = KeyGen.fromJson(res1.body?.content);
    print('body1${res1.body?.content}');
    final Response<BaseResponse> res =
        await provider.deviceReg(result.deviceName, body1.keys![0].key ?? '');
    DeviceReg content = DeviceReg.fromJson(res.body?.content);
    print('content${res.body?.content}');
  }

  pushMessage() async {
    final Response<BaseResponse> res1 = await provider.messagePush(
        'PDU1TFYmrtCJuySPJmW1AnxI4KC5c4ho2KbVG', '11111');
    PushMessage body1 = PushMessage.fromJson(res1.body?.content);

    print('res1.body${res1.body?.content}');
  }

  messageList() async {
    final Response<BaseResponse> res1 = await provider.messageList();
    MessageList body1 = MessageList.fromJson(res1.body?.content);

    print('messageList.body${res1.body?.content}');

    messages.value = body1.messages ?? [];
  }
}
