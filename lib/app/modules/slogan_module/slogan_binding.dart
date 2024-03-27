import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/slogan_module/slogan_controller.dart';
class SloganBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SloganController>(
      () => SloganController(),
    );
  }
}
