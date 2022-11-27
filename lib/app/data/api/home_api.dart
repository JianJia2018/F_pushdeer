import 'package:f_pushdeer/app/data/api/base_connect.dart';
import 'package:f_pushdeer/app/data/models/base_res.dart';
import 'package:f_pushdeer/app/utils/storage.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../models/models.dart';

class HomeProvider extends BaseProvider {
  final sToken = globalStorage.read('token');

  Future<Response<BaseResponse>> loginFake() => get('login/fake');
  Future<Response<BaseResponse>> simpleToken(String token) =>
      post('login/simple_token', {'stoken': token});
  Future<Response<BaseResponse>> simpleTokenRegen() =>
      post('simple_token/regen', {});
  Future<Response<BaseResponse>> simpleTokenRemove() =>
      post('simple_token/remove', {});
  Future<Response<BaseResponse>> userInfo(String token) =>
      post('user/info', {'token': token});
  Future<Response<BaseResponse>> deviceReg(
          String deviceName, String deviceId) =>
      post('device/reg', {
        'token': sToken,
        'name': deviceName,
        "device_id": deviceId,
        "is_clip": 0
      });
  Future<Response<BaseResponse>> deviceList() => post('device/list', {});

  Future<Response<BaseResponse>> keyGen() => post('key/gen', {'token': sToken});
  Future<Response<BaseResponse>> messageList() =>
      post('message/list', {'token': sToken, "limit": 10});
  Future<Response<BaseResponse>> messagePush(String pushkey, String text,
          {String? desp, int? type}) =>
      post('message/push', {'token': sToken, 'pushkey': pushkey, 'text': text});
}
