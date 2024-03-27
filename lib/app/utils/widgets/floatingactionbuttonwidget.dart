import 'package:flutter/material.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/app_button.dart';
class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      onPressed: () {},
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(13),
        topRight: Radius.circular(13),
      ),
      text: "Call customer Care",
      style: AppTextStyles.base.s12.w400.whiteColor,
      width: Common.getDeviceSepcificDouble(175, desktopValue: 170),
      height: Common.getDeviceSepcificDouble(35, desktopValue: 30),
      padding: EdgeInsets.only(
          left: Common.getDeviceSepcificDouble(10, desktopValue: 8),
          bottom: Common.getDeviceSepcificDouble(0, desktopValue: 0)),
      suffixIcon: Icon(
        Icons.call,
        size: Common.getDeviceSepcificDouble(18, desktopValue: 17),
      ),
    );
  }
}
