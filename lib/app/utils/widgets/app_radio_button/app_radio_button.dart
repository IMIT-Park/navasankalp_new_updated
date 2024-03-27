import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';

class AppRadioButton extends GetWidget {
  const AppRadioButton({key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 114,
          height: 41,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFF407DF2)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹ $text",
                style: const TextStyle(
                    color: AppColors.kPrimaryColor, fontSize: 15),
              )
            ],
          ),
        ),
      ],
    );
  }
}
