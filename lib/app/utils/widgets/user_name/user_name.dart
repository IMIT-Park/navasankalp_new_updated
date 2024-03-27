import 'package:flutter/material.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';

class CircleAvatarWithText extends StatelessWidget {
  final String imageUrl;
  final String? username;

  const CircleAvatarWithText({
    Key? key,
    required this.imageUrl,
    this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage(imageUrl), // Use NetworkImage here
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  username.toString(),
                  softWrap: true,
                  style: AppTextStyles.getAppTextStyleCustomized(
                    textColor: AppColors.kPrimaryColor,
                    textWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
