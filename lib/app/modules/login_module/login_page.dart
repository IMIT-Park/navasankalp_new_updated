import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/login_module/login_page_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/app_button.dart';
class LoginPage extends GetWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.white,
      body: loginPageBody(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: AppButton(
        onPressed: () async {},
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
        text: "Call customer Care",
        style: AppTextStyles.base.s14.w400.whiteColor,
        width: Common.getDeviceSepcificDouble(190, desktopValue: 180),
        height: Common.getDeviceSepcificDouble(35, desktopValue: 30),
        color: AppColors.lightBlue,
        padding: EdgeInsets.only(
            left: Common.getDeviceSepcificDouble(10, desktopValue: 8),
            bottom: Common.getDeviceSepcificDouble(0, desktopValue: 0)),
        suffixIcon: Icon(
          Icons.call,
          size: Common.getDeviceSepcificDouble(18, desktopValue: 17),
        ),
      ),
    );
  }
}

Widget loginPageBody() {
  LoginController loginController = Get.find<LoginController>();
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Common.getDeviceSepcificDouble(100, desktopValue: 90),
          ),
          Image(
            image: const AssetImage("assets/navasankalp_Logo.jpg"),
            fit: BoxFit.contain,
            width: double.infinity,
            height: Common.getDeviceSepcificDouble(68, desktopValue: 90),
          ),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) =>
                AppColors.navasankalptextcolor.createShader(
              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
            ),
            child: Text("Nava Sankalp",
                style: AppTextStyles.getAppTextStyleCustomized(
                        textSize: 30, textWeight: FontWeight.w600)
                    .kPrimaryColor),
          ),
          SizedBox(
            height: Common.getDeviceSepcificDouble(20, desktopValue: 28),
          ),
          ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => AppColors.linercolors.createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
              child: Text("Login",
                  style: AppTextStyles.getAppTextStyleCustomized(
                    textSize: 30,
                    textWeight: FontWeight.w600,
                  ))),
          SizedBox(
            height: Common.getDeviceSepcificDouble(108,
                desktopValue: 104), // Adjust the height as needed
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton.outline(
                onPressed: () async {
                  loginController.signInWithGoogle();
                },
                height: Common.getDeviceSepcificDouble(58, desktopValue: 58),
                width: Common.getDeviceSepcificDouble(268, desktopValue: 280),
                space: 1,
                suffixIcon: Image.asset(
                  "assets/image 48.jpg",
                  height: Common.getDeviceSepcificDouble(30, desktopValue: 40),
                  fit: BoxFit.fitHeight,
                ),
                textSize: 22,
                padding: EdgeInsets.symmetric(
                  horizontal:
                      Common.getDeviceSepcificDouble(20, desktopValue: 20),
                ),
                text: "Login with Google",
                style: AppTextStyles.getAppTextStyleCustomized(
                    textWeight: FontWeight.w500, textColor: AppColors.black),

                color: AppColors.lightBlack,
                borderRadius: BorderRadius.circular(10),

                // Add other properties as needed
              ),
            ],
          ),
          SizedBox(
            height: Common.getDeviceSepcificDouble(120, desktopValue: 80),
          ),
        ],
      ),
    ),
  );
}
