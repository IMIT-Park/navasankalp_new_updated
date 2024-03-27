import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/history_module/history_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_bar/custom_app_bar.dart';
class HistoryPage extends GetWidget<HistoryController> {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: NavaSankalp.back,
        leadingIconColor: AppColors.black,
        actionIconSize: Common.getDeviceSepcificDouble(18, desktopValue: 14),
        leadingIconSize: Common.getDeviceSepcificDouble(20, desktopValue: 17),
        actionIconColor: AppColors.black,
        title: "History",
        titleSize: Common.getDeviceSepcificDouble(15, desktopValue: 14),
        onLeadingPressed: () => Get.close(1),
      ),
      body: historyPageBody(),
    );
  }
}

Widget historyPageBody() {
  HistoryController historyController = Get.find();
  return Obx(
    () => ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return getHistoryTile(
          cardaction: () async {
            Common.launchUrls(historyController.historyList[index].link.toString());
          },
          cardtitle: historyController.historyList[index].title.toString(),
          cardcontent:
              historyController.historyList[index].description.toString(),
        );
      },
      itemCount: historyController.historyList.length,
    ),
  );
}

Widget getHistoryTile({
  required String cardtitle,
  required String cardcontent,
  required VoidCallback cardaction,
}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.1),
            offset: const Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 17, right: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cardtitle,
              textScaleFactor:
                  Common.getDeviceSepcificDouble(1, desktopValue: 0.9),
              style: AppTextStyles.malayalamStyle.w900.s12.poppins,
            ),
            SizedBox(
              height: Common.getDeviceSepcificDouble(7, desktopValue: 7),
            ),
            Text(
              cardcontent,
              maxLines: 8,
              textScaleFactor: 1,
              style: AppTextStyles.getMalayalamTextStyleCustomized(
                textHeight: 1.4,
                textSize: Common.getDeviceSepcificDouble(12, desktopValue: 11),
                textWeight: FontWeight.w500,
                textColor: AppColors.black.withAlpha(178),
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: Common.getDeviceSepcificDouble(5, desktopValue: 5),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: Common.getDeviceSepcificDouble(4),
                bottom: Common.getDeviceSepcificDouble(12, desktopValue: 10),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: cardaction,
                  child: Text(
                    "More",
                    textScaleFactor: 0.9,
                    style: AppTextStyles.getAppTextStyleCustomized(
                      textSize:
                          Common.getDeviceSepcificDouble(12, desktopValue: 12),
                      textWeight: FontWeight.bold,
                      textColor: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
