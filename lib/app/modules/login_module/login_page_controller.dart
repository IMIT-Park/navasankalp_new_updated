import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:navasankalp_application/app/data/model/login_model.dart';
import 'package:navasankalp_application/app/data/provider/navasankalp_be_provider.dart';
import 'package:navasankalp_application/app/modules/app_notification_module/app_notification_controller.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_pref.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void onInit() {
    final notificationController = Get.put<NotificationController>(NotificationController());
    notificationController.initialize();
    // initPlatformState();
    // getDeviceIdentifier();
    super.onInit();
  }

  final _pref = NavaSankalpPref();
  final provider = Get.find<NavaSankalpBEProvider>();
  RxBool isLoading = false.obs;
  Future<UserCredential?> signInWithGoogle() async {
    isLoading.value =true;
    // update();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      debugPrint(googleAuth.accessToken);

      log(googleAuth.accessToken.toString());

      UserLoginRequest login = UserLoginRequest(
        googleToken: googleAuth.accessToken,
      );
      

      debugPrint(_pref.googleAccessToken.val);
      await provider.loginUser(login).then((value) async {
        await Future.delayed(const Duration(seconds: 2), () {
          _pref.accessToken.val = value.accessToken ?? "";
          _pref.refreshToken.val = value.refreshToken ?? "";
           isLoading.value =false;
           update();
        });

        log(_pref.refreshToken.val);
        log(_pref.accessToken.val);
        Get.offNamedUntil(AppRoutes.home, (route) => false);
      });
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      Common.showError("Error during Google Sign In: $e");
      // log(e.toString());
      return null;
    }
  }

  // Future<void> signOut() async {
  //   try {
  //     await _googleSignIn.signOut();
  //     await _auth.signOut();
  //     final deleteToken = GetStorage();
  //     await deleteToken.remove(_pref.accessToken.key);
  //     await deleteToken.remove(_pref.refreshToken.key);
  //     await deleteToken.remove(_pref.googleAccessToken.key);
  //     await deleteToken.remove(_pref.deviceid.key);
  //     await deleteToken.remove(_pref.devicetoken.key);
  //     Navigator.pop(Get.context!);
  //     Get.toNamed(AppRoutes.login);
  //   } catch (e) {
  //     log("Error during sign out: $e");
  //   }
  // }

  // Future<void> initPlatformState() async {
  //   String? deviceId;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     deviceId = await PlatformDeviceId.getDeviceId;

  //     await Future.delayed(Duration(seconds: 2), () {
  //       _pref.deviceid.val = deviceId ?? "";
  //       debugPrint("device id $deviceId");
  //     });
  //   } on PlatformException {
  //     deviceId = 'Failed to get deviceId.';
  //   }

  //   void setLoading(RxBool loading) {
  //     isLoading = loading;
  //     update();
  //   }
  // }
      void setLoading(RxBool loading) {
      isLoading = loading;
      update();
    }
}
