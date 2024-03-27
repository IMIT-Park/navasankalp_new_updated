import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/account_module/account_controller.dart';

class AccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(
      () => AccountController(),
    );
  }
}
