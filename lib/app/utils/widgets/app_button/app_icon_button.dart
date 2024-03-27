import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
class AppIconButton extends GetWidget {
  const AppIconButton(
      {Key? key,
      required this.name,
      required this.iconData,
      required this.onTap})
      : super(key: key);

  final String name;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    Common.getDeviceSepcificDouble(5, desktopValue: 10))),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: AppColors.kPrimaryColor,
                size: Common.getDeviceSepcificDouble(25, desktopValue: 35),
              ),
              Text(name, textAlign: TextAlign.center, style: AppTextStyles.base.s14.w800)
            ],
          ),
        ),
      ),
    );
  }
}
