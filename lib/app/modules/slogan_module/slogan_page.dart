import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:navasankalp_application/app/modules/slogan_module/slogan_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:share_plus/share_plus.dart';

Widget getSloganTile(
    {required String sloganDateTime,
    required String sloganMsg,
    required int index}) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Common.getDeviceSepcificDouble(12, desktopValue: 6),
        vertical: Common.getDeviceSepcificDouble(4, desktopValue: 6)),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            blurRadius: 1,
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                sloganDateTime,
                style: AppTextStyles.base.w500.s12.kPrimaryColor,
              ),
              getMenuWidget(index: index),
            ]),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                sloganMsg,
                style: AppTextStyles.base.w600.s14.poppins,
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class MenuItem {
  final String name;
  final VoidCallback? onPressed;
  MenuItem({required this.name, this.onPressed});
}

Widget getMenuWidget({
  required int index,
}) {
  SloganController sloganController = Get.find<SloganController>();

  return Material(
    color: AppColors.white,
    child: MenuAnchor(
        alignmentOffset: Offset(
            Common.getDeviceSepcificDouble(-117, desktopValue: -102),
            Common.getDeviceSepcificDouble(-32, desktopValue: -30)),
        builder: (
          buildContext,
          MenuController controller,
          Widget? child,
        ) {
          return IconButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            icon: const Icon(NavaSankalp.three_dot_menu),
          );
        },
        menuChildren: <Widget>[
          getMenuChild(
            MenuItem(
              name: "Copy",
              onPressed: () {
                if (sloganController.sloganList.isNotEmpty) {
                  final sloganToCopy =
                      sloganController.sloganList[index].slogan;
                  Get.find<SloganController>()
                      .copyToClipboard(sloganToCopy.toString());
                }
              },
            ),
          ),
          const Divider(
            color: AppColors.grey,
            thickness: .5,
            height: 1,
            indent: 8,
            endIndent: 8,
          ),
          getMenuChild(MenuItem(
              name: "Share",
              onPressed: () {
                Share.share(
                    sloganController.sloganList[index].slogan.toString());
              })),
        ]),
  );
}

Widget getMenuChild(
  MenuItem menuItem,
) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: Common.getDeviceSepcificDouble(35, desktopValue: 30),
    ),
    child: SizedBox(
      height: Common.getDeviceSepcificDouble(30, desktopValue: 36),
      child: MenuItemButton(
        onPressed: menuItem.onPressed ?? () {},
        child: Text(
          menuItem.name,
          style: AppTextStyles.base.w600.s14.poppins,
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}

Widget sloganPageBody() {
  SloganController sloganController = Get.find<SloganController>();
  return Obx(
    () => ListView.builder(
      itemCount: sloganController.sloganList.length,
      itemBuilder: (BuildContext context, int index) {
        return getSloganTile(
            sloganDateTime: DateFormat('MMM d, y').format(
              DateTime.parse(
                sloganController.sloganList[index].createdAt.toString(),
              ),
            ),
            sloganMsg: sloganController.sloganList[index].slogan.toString(),
            index: index);
      },
    ),
  );
}

class SloganPage extends GetWidget {
  const SloganPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconColor: AppColors.black,
        actionIconColor: AppColors.black,
        backgroundColor: AppColors.transparent,
        leadingIconData: NavaSankalp.back,
        onLeadingPressed: () => Get.close(1),
        title: "Slogan",
      ),
      body: sloganPageBody(),
    );
  }
}
