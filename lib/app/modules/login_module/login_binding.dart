import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/login_module/login_page_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
