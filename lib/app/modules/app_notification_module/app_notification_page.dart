import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/app_notification_module/app_notification_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/extensions.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_bar/custom_app_bar.dart';
class NotificationPage extends GetWidget<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leadingIconColor: AppColors.black,
        actionIconColor: AppColors.black,
        backgroundColor: AppColors.transparent,
        leadingIconData: NavaSankalp.back,
        onLeadingPressed: () => Get.close(1),
        title: "Notifications",
      ),
      body: notificationPageBody(""),
    );
  }
}

Widget notificationPageBody(String? payload) {
  final notificationController = Get.find<NotificationController>();

  return Obx(
    () => notificationController.notificationList.isEmpty
        ? Center(
            child: Image.asset(
              'assets/EmptyNotification.gif',
              width: 200,
              height: 200,
            ),
          )
        : ListView.builder(
            itemCount: notificationController.notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              return getNotificationTile(
                notificationId:
                    notificationController.notificationList[index].id!,
                userImage: notificationController
                            .notificationList[index].imageUrl !=
                        null
                    ? notificationController.notificationList[index].imageUrl!
                        .attachAssetBaseURL()
                    : null,
                userName: notificationController.notificationList[index].title
                    .toString(),
                notificationMessage: notificationController
                    .notificationList[index].message
                    .toString(),
                updatedTime: Common.timeAgo(
                  DateTime.parse(
                    notificationController.notificationList[index].createdAt
                        .toString(),
                  ),
                ),
                readStatus:
                    notificationController.notificationList[index].readStatus ==
                            1
                        ? true
                        : false,
              );
            },
          ),
  );
}

Widget getNotificationTile({
  required bool readStatus,
  required String userName,
  required String notificationMessage,
  required String updatedTime,
  required String? userImage,
  required int notificationId,
}) {
  NotificationController notificationController = Get.find();
  return InkWell(
    onTap: () async {
      await notificationController.changeNotificationStatus(notificationId);
    },
    child: Column(
      children: [
        Container(
          color: readStatus ? AppColors.whiteGrey : AppColors.white,
          padding:
              const EdgeInsets.only(left: 10, right: 35, bottom: 10, top: 10),
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  userName,
                                  style: AppTextStyles.base.w600.s16.poppins,
                                ),
                                Text(
                                  notificationMessage,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.base.s12.w400.poppins,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        userImage == null
                            ? const SizedBox()
                            : Container(
                                height: 132,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(userImage),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              updatedTime,
                              style: AppTextStyles.getAppTextStyleCustomized(
                                textSize: Common.getDeviceSepcificDouble(10,
                                    desktopValue: 8),
                                textColor: AppColors.black.withAlpha(102),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    ),
  );
}
