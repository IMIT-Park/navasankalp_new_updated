import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:navasankalp_application/app/modules/app_notification_module/app_notification_controller.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_pref.dart';
// import 'package:platform_device_id/platform_device_id.dart';

import '../../../data/provider/global_data_provider.dart';

class DrawersController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _pref = NavaSankalpPref();

  final GlobalDataProvider _globalDataProvider = Get.find<GlobalDataProvider>();

  final RxString photo = "".obs;
  final RxString name = "".obs;
  Future<void> getUserData() async {
    final result = await _globalDataProvider.getAccountData();
    photo.value = result.photo.toString();
    name.value = result.name.toString();
  }

  @override
  void onReady() {
    super.onReady();
    Common.safeApiCall(getUserData());
  }

  @override
  void onInit() {
    final notificationController =
        Get.put<NotificationController>(NotificationController());
    notificationController.initialize();
    initPlatformState();
    // getDeviceIdentifier();
    super.onInit();
  }

  Future<void> initPlatformState() async {
    String? deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    //   try {
    //     deviceId = await PlatformDeviceId.getDeviceId;

    //     await Future.delayed(const Duration(seconds: 2), () {
    //       _pref.deviceid.val = deviceId ?? "";
    //       debugPrint("device id $deviceId");
    //     });
    //   } on PlatformException {
    //     deviceId = 'Failed to get deviceId.';
    //   }
    // }
  }

  Future<void> signOut() async {
    try {
      final deleteToken = GetStorage();
      await deleteToken.remove(_pref.accessToken.key);
      await deleteToken.remove(_pref.refreshToken.key);
      await _googleSignIn.signOut();

      Get.offNamedUntil(AppRoutes.login, (route) => false);
      // Get.toNamed();
    } catch (e) {
      log("Error during sign out: $e");
    }
  }
}
