import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/provider/global_data_provider.dart';
import 'package:navasankalp_application/app/modules/privacy_policy_module/privacy_policy_page.dart';
import 'package:navasankalp_application/app/routes/app_pages.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/constants.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/app_button.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/drawer_buttons.dart';
import 'package:navasankalp_application/app/utils/widgets/user_name/user_name.dart';
import 'package:share_plus/share_plus.dart';

import 'drawer_controller.dart';

class DrawerTileData {
  final IconData icon;
  final String tileName;
  final VoidCallback callback;
  final bool counter;

  DrawerTileData(this.icon, this.tileName, this.callback, this.counter);
}

var arrayOfListTiles = [
  DrawerTileData(NavaSankalp.profile, "Account", () {
    Navigator.pop(Get.context!);
    Get.toNamed(AppRoutes.account);
  }, false),
  DrawerTileData(NavaSankalp.notification_solid_badged, "Notification", () {
    Navigator.pop(Get.context!);
    Get.toNamed(AppRoutes.notification);
  }, true),
  DrawerTileData(NavaSankalp.share, "Share App", () {
    Share.share("Navasankalp APP!...");
  }, false),
  DrawerTileData(NavaSankalp.history, "Transcation History", () {
    Navigator.pop(Get.context!);
    Get.toNamed(AppRoutes.transaction);
  }, false),
  DrawerTileData(NavaSankalp.star, "Rating", () {
    Navigator.pop(Get.context!);
  }, false),
  DrawerTileData(NavaSankalp.policy, "Privacy Policy", () {
    Navigator.pop(Get.context!);
    Get.to(const PrivacyPolicyPage());
  }, false),
  DrawerTileData(NavaSankalp.logout, "Log Out", () {
    final drawersController = Get.find<DrawersController>();
    drawersController.signOut();
  }, false),
];

class CustomAppDrawer extends GetWidget<DrawersController> {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          GetPlatform.isMobile && Get.context!.isPhone ? Get.width * 1 : null,
      color: AppColors.white,
      child: drawerWidget(controller),
    );
  }

  Drawer drawerWidget(controller) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(
            left: 14,
            right: 10,
            top: GetPlatform.isMobile && Get.context!.isPhone ? 25 : 0),
        children: [
          getDrawerHeader(controller),
          const SizedBox(
            height: 22,
          ),
          for (DrawerTileData listTile in arrayOfListTiles)
            setListTile(listTile.icon, listTile.tileName, listTile.callback,
                listTile.counter),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 26, 0, 0),
            child: Text("DCC Social Media Pages",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Colors.blueAccent,
                )),
          ),
          SizedBox(
            height: Common.getDeviceSepcificDouble(25, desktopValue: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: drawerSocialMediaBar(),
          ),
          const SizedBox(
            height: 10,
          ),
          AppButton(
            onPressed: () {
              Common.launchUrls("https://dccthrissur.com/");
            },
            borderRadius: BorderRadius.circular(6),
            text: "www.dccthrissur.com",
            textSize: 12,
            textWeight: FontWeight.w400,
            width: double.infinity,
            height: Common.getDeviceSepcificDouble(38, desktopValue: 30),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          ),
          const SizedBox(
            height: 45,
          ),
        ],
      ),
    );
  }

  Widget getDrawerHeader(DrawersController contrller) {
    return SizedBox(
      height: 150,
      child: DrawerHeader(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
        child: Row(
          children: [
            Expanded(
              child: Obx(() => CircleAvatarWithText(
                    imageUrl: contrller.photo.isNotEmpty
                        ? contrller.photo.value.startsWith("https:")
                            ? contrller.photo.value
                            : "${EndPoints.assetBaseUrl}${contrller.photo.value}"
                        : "https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=",
                    username: contrller.name.isNotEmpty
                        ? contrller.name.value
                        : "User",
                  )),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 0,
                    bottom:
                        GetPlatform.isMobile && Get.context!.isPhone ? 18 : 0),
                child: IconButton(
                  iconSize: 25,
                  onPressed: () {
                    Navigator.pop(Get.overlayContext!);
                  },
                  icon: Icon(
                    NavaSankalp.close,
                    size: 30,
                    color: AppColors.black.withAlpha(112),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox drawerSocialMediaBar() {
    return SizedBox(
      height: GetPlatform.isMobile && Get.context!.isPhone ? 45 : 38,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 20,
            child: DrawerSocialMediaButton(
              suffixIcon: NavaSankalp.facebook,
              onPressed: () {
                Common.launchUrls(
                    "https://www.facebook.com/DCCThrissurOfficial/");
              },
              color: AppColors.kPrimaryColor,
            ),
          ),
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: 20,
            child: DrawerSocialMediaButton(
              suffixIcon: NavaSankalp.instagram,
              onPressed: () {
                Common.launchUrls(
                    "https://www.instagram.com/explore/locations/680566155402471/dcc-thrissur/");
              },
              gradientcolor: AppColors.linercolor,
            ),
          ),
          Flexible(flex: 1, child: Container()),
          Flexible(
            flex: 20,
            child: DrawerSocialMediaButton(
                color: Colors.red.shade600,
                suffixIcon: NavaSankalp.youtube,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  ListTile setListTile(
      IconData iconData, String data, GestureTapCallback onTap, bool trailing) {
    Color itemColor = AppColors.black.withAlpha(127);
    final globalDataProvider = GlobalDataProvider();
    return ListTile(
      leading: Icon(
        iconData,
        size: Common.getDeviceSepcificDouble(23, desktopValue: 20),
        color: itemColor,
      ),
      trailing: trailing == true
          ? globalDataProvider.notificationdata.isNotEmpty == true
              ? CircleAvatar(
                  maxRadius: 10,
                  child: Text(
                    globalDataProvider.notificationdata.length.toString(),
                    style: AppTextStyles.base.whiteColor.poppins.s12,
                  ))
              : const SizedBox()
          : const SizedBox(),
      horizontalTitleGap: 20,
      title: Text(
        data,
        textScaleFactor: Common.getDeviceSepcificDouble(.8, desktopValue: .7),
        style: AppTextStyles.getAppTextStyleCustomized(
          textWeight: FontWeight.w500,
          textColor: itemColor,
        ),
      ),
      onTap: onTap,
    );
  }
}
