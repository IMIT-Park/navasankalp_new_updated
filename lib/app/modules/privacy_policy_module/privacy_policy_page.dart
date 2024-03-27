import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_bar/custom_app_bar.dart';

class PrivacyPolicyPage extends GetWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconColor: AppColors.black,
        actionIconColor: AppColors.black,
        backgroundColor: AppColors.transparent,
        leadingIconData: NavaSankalp.back,
        onLeadingPressed: () => Get.close(1),
        title: "Privacy Policy",
      ),
      body: privacyPolicy(),
    );
  }

  Widget privacyPolicy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 14),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
              textAlign: TextAlign.center,
              style: AppTextStyles.base.w400.s16.poppins,
            ),
          ],
        ),
      ),
    );
  }
}
