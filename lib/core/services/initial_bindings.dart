import 'package:admob/view/home/home_controller.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthController.instance, fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
