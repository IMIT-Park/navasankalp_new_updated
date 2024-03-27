import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/directory_module/directory_controller.dart';

class DirectoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DirectoryController>(
      () => DirectoryController(),
    );
  }
}
