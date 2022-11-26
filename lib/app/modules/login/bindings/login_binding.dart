import 'package:f_pushdeer/app/data/api/home_api.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<HomeProvider>(() => HomeProvider());
  }
}
