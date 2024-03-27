import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/api/api_error.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class Common {
  Common._();

  static String timeAgo(DateTime d) {
    Duration diff = DateTime.now().difference(d);
    if (diff.inDays > 365) {
      return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
    }
    if (diff.inDays > 30) {
      return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
    }
    if (diff.inDays > 7) {
      return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
    }
    if (diff.inDays > 0) {
      return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
    }
    if (diff.inHours > 0) {
      return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
    }
    if (diff.inMinutes > 0) {
      return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
    }
    return "just now";
  }

  static double getDeviceSepcificDouble(double defaultValue,
      {double? desktopValue}) {
    if (GetPlatform.isDesktop) return desktopValue ?? defaultValue;
    return defaultValue;
  }

  static int getDeviceSepcificInt(int defaultValue, {int? desktopValue}) {
    if (GetPlatform.isDesktop) return desktopValue ?? defaultValue;
    return defaultValue;
  }

  static Future<T?> safeApiCall<T>(Future<T> apiCall,
      {showBloackingUI = true}) async {
    if (showBloackingUI) Common.showLoading();
    try {
      var data = await apiCall;
      if (showBloackingUI) {
        Navigator.of(Get.overlayContext!).pop();
      }
      return data;
    } on ApiErrors catch (e) {
      if (showBloackingUI) {
        Navigator.of(Get.overlayContext!).pop();
      }
      showError(e.message);
    } on Exception {
      if (showBloackingUI) {
        Navigator.of(Get.overlayContext!).pop();
      }
      showError("Unknown Error");
    }
    return null;
  }

  static void showSuccess(String error) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          error,
          style: AppTextStyles.base.w700.s16.whiteColor,
        ),
        margin: const EdgeInsets.all(20),
        borderRadius: 24,
        backgroundColor: AppColors.green,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  static void showError(String error) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Text(
          error,
          style: AppTextStyles.base.w700.s16.whiteColor,
        ),
        margin: const EdgeInsets.all(20),
        borderRadius: 24,
        backgroundColor: AppColors.red,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

static void launchUrls(String url)async{
 final Uri urls = Uri.parse(url);
    if (!await launchUrl(urls)) {
      throw Exception('Could not launch $urls');
    }else {
      print('Could not launch $url');
    }
}



  static GlobalKey<NavigatorState> showLoading() {
    final dialogNavigator = GlobalKey<NavigatorState>();
    Get.dialog(
        Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: AppColors.transparent,
            ),
            child: const SpinKitFadingCircle(
              size: 50,
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        barrierColor: AppColors.white.withOpacity(0.8),
        barrierDismissible: false,
        transitionCurve: Curves.easeInOutBack,
        navigatorKey: dialogNavigator);
    return dialogNavigator;
  }

  static void dismissKeyboard() => Get.focusScope!.unfocus();
}
