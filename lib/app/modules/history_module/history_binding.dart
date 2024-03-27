import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/history_module/history_controller.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryController>(
      () => HistoryController(),
    );
  }
}
