import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_pref.dart';
class SplashPage extends GetWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _pref = NavaSankalpPref();

    ///Your Function in the Future
    Future.delayed(const Duration(seconds: 2), () {
      // 2s over, navigate to a new page

      if (_pref.accessToken.val == "") {
        Get.offNamedUntil(AppRoutes.login, (route) => false);
      } else {
        Get.offNamedUntil(AppRoutes.home, (route) => false);
      }
    });

    ///Your widget
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: Get.size.width,
          height: Get.size.height,
          child: Image.asset('assets/splash.jpg', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
