import 'package:get/get.dart';
import 'package:navasankalp_application/app/utils/widgets/app_drawer/drawer_controller.dart';

class AppDrawerBindings implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(()=>DrawersController());
  }

}