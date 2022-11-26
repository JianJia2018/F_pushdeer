import 'package:f_pushdeer/app/config/conf.dart';
import 'package:f_pushdeer/app/data/models/base_res.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = BaseResponse.fromJson2;
    httpClient.baseUrl = baseHost;

    ///请求拦截
    httpClient.addRequestModifier<void>((request) {
      request.headers['token'] = '12345678';
      return request;
    });

    //token
    httpClient.addAuthenticator<void>((request) async {
      final response = await get("http://yourapi/token");
      final token = response.body['token'];
      // Set the header
      request.headers['Authorization'] = "$token";
      return request;
    });

    // 响应拦截
    httpClient.addResponseModifier(
        (Request<dynamic> request, Response<dynamic> response) {
      BaseResponse? model = response.body;
      print('response$response');
      if (response.hasError) {
        Get.snackbar('错误', '${response.hasError}');
      } else {
        //请求成功时，显示数据
        if (response.statusCode == 200) {
          // BaseResponse? model = response.body;
          if (response.body?.code == 0) {
            return response;
          } else {
            Get.snackbar('请求错误', '${response.body?.error}');
          }
        } else {
          Get.snackbar('错误', '${response.body}');
        }
      }
      return response;
    });

    httpClient.maxAuthRetries = 3;
  }
}
