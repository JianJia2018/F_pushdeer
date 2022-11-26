import 'package:f_pushdeer/app/data/api/base_connect.dart';
import 'package:f_pushdeer/app/data/models/base_res.dart';
import 'package:get/get_connect/http/src/response/response.dart';

import '../models/models.dart';

class HomeProvider extends BaseProvider {
  Future<Response<BaseResponse>> loginFake() => get('login/fake');
  Future<Response<BaseResponse>> simpleToken(String token) =>
      post('login/simple_token', {'stoken': token});
  Future<Response<BaseResponse>> simpleTokenRegen() =>
      post('simple_token/regen', {});
  Future<Response<BaseResponse>> simpleTokenRemove() =>
      post('simple_token/remove', {});
  Future<Response<BaseResponse>> userInfo(String token) =>
      post('user/info', {'token': token});
  Future<Response<BaseResponse>> deviceReg() => post('device/reg', {});
  Future<Response<BaseResponse>> deviceList() => post('device/list', {});
}
