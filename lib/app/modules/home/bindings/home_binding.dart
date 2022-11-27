import 'package:f_pushdeer/app/data/api/home_api.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(HomeProvider());
  }
}
