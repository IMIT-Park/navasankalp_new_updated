import 'package:flutter/material.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/app_button.dart';


class DrawerSocialMediaButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final IconData suffixIcon;
  final VoidCallback onPressed;
  final Gradient? gradientcolor;

  const DrawerSocialMediaButton(
      {super.key,
      this.width,
      this.height,
      this.color,
      required this.suffixIcon,
      required this.onPressed,
      this.gradientcolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradientcolor,
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        height: height ?? double.infinity,
        width: width ?? double.infinity,
        child: AppButton(
          onPressed: onPressed,
          color: Colors.transparent,
          suffixIcon: Icon(
            suffixIcon,
            size: Common.getDeviceSepcificDouble(20, desktopValue: 18),
          ),
          space: 0,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        ),
      ),
    );
  }
}
