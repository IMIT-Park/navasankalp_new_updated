import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/app_notification_module/app_notification_controller.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}
