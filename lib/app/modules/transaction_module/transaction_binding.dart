import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/transaction_module/transaction_controller.dart';

class TransactionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(
      () => TransactionController(),
    );
  }
}
