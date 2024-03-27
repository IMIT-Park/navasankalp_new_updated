import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/modules/directory_module/directory_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/extensions.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_bar/custom_app_bar.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class DirectoryPage extends GetWidget<DirectoryController> {
  const DirectoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        leadingIconData: NavaSankalp.back,
        leadingIconColor: AppColors.black,
        actionIconSize: Common.getDeviceSepcificDouble(18, desktopValue: 14),
        leadingIconSize: Common.getDeviceSepcificDouble(20, desktopValue: 17),
        actionIconColor: AppColors.black,
        title: "Directory",
        titleSize: Common.getDeviceSepcificDouble(15, desktopValue: 14),
        onLeadingPressed: () => Get.close(1),
      ),
      body: directoryBody(),
    );
  }
}

Widget directoryBody() {
  DirectoryController directoryController = Get.find();
  return Obx(
    () => ListView(
      padding: EdgeInsets.only(
        left: Common.getDeviceSepcificDouble(10, desktopValue: 8),
        right: Common.getDeviceSepcificDouble(10, desktopValue: 8),
      ),
      scrollDirection: Axis.vertical,
      controller: directoryController.controller,
      children: directoryController.groupedMap.keys.map((key) {
        return StickyHeader(
          controller: directoryController.controller,
          header: Container(
            color: AppColors.white,
            height: 50.0,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
            alignment: Alignment.centerLeft,
            child: Text(
              key,
              style: const TextStyle(color: AppColors.black),
            ),
          ),
          content: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final item = directoryController.groupedMap[key]![index];
              return Padding(
                padding:  EdgeInsets.symmetric(vertical: Common.getDeviceSepcificDouble(8, desktopValue: 8),
                horizontal: Common.getDeviceSepcificDouble(2, desktopValue: 2)),
                child: directoryTile(
                  addressdata: item.address.toString(),
                  userImage: item.image.toString(),
                  userName: item.name.toString(),
                  landNumber: item.landline.toString(),
                  phoneNumber: item.phone.toString(),
                  email: item.email.toString(),
                  position: item.designation.toString(),
                ),
              );
            },
            itemCount: directoryController.groupedMap[key]!.length,
          ),
        );
      }).toList(),
    ),
  );
}

Widget directoryTile({
  required String addressdata,
  required String userImage,
  required String userName,
  required String phoneNumber,
  required String landNumber,
  String? position,
  String? email,
}
) {
    DirectoryController directoryController = Get.find();

  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      image: const DecorationImage(
        opacity: .4,
        fit: BoxFit.cover,
        image: AssetImage("assets/home_background_top.jpg"),
      ),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(            
              image: NetworkImage(             
                userImage.attachAssetBaseURL(),               
              ),
              fit: BoxFit.cover,
            ),
          ),
          height: Common.getDeviceSepcificDouble(120, desktopValue: 150),
          width: Common.getDeviceSepcificDouble(110, desktopValue: 130),
          margin: const EdgeInsets.only(left: 4,),
        ),
        SizedBox(
          width: Common.getDeviceSepcificDouble(14),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 6,
              right: 14,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  maxLines: 1,
                  style: AppTextStyles.getAppTextStyleCustomized(
                      textWeight: FontWeight.w600, textSize: 15),
                ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(3),
                ),
                position == "null"
                    ? const SizedBox()
                    : Text(
                        position!,
                        style: AppTextStyles.getAppTextStyleCustomized(
                          textSize: 10,
                          textWeight: FontWeight.w300,
                        ),
                      ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(3),
                ),
                Text(
                  "Office Address",
                  style: AppTextStyles.getAppTextStyleCustomized(
                    textSize: 10,
                    textWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(2),
                ),
                Text(
                  addressdata,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.getAppTextStyleCustomized(
                    textWeight: FontWeight.w400,
                    textSize: 10,
                  ),
                ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(4),
                ),
               
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                         phoneNumber == ""
                    ? const SizedBox()
                    :
                        Row(
                          children: [
                            const Icon(
                              NavaSankalp.phone,
                              size: 8,
                              color: AppColors.orange,
                            ),
                            SizedBox(
                              width: Common.getDeviceSepcificDouble(2,
                                  desktopValue: 10),
                            ),
                            GestureDetector(
                              onTap: () {
                                directoryController.launchPhone(landNumber);
                              },
                              child: Text(
                                phoneNumber,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.getAppTextStyleCustomized(
                                  textWeight: FontWeight.w600,
                                  textSize: 10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height:
                          Common.getDeviceSepcificDouble(15, desktopValue: 10),
                      width:
                          Common.getDeviceSepcificDouble(8, desktopValue: 10),
                    ),
                    landNumber == ""
                    ? const SizedBox()
                    :
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            NavaSankalp.phone,
                            size: 8,
                            color: AppColors.orange,
                          ),
                          SizedBox(
                            width: Common.getDeviceSepcificDouble(2,
                                desktopValue: 10),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                directoryController.launchPhone(landNumber);
                              },
                              child: Text(
                                landNumber,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.getAppTextStyleCustomized(
                                  textWeight: FontWeight.w600,
                                  textSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                email == "null"
                    ? const SizedBox()
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(
                            NavaSankalp.mail,
                            size: 8,
                            color: AppColors.orange,
                          ),
                          SizedBox(
                            width: Common.getDeviceSepcificDouble(8,
                                desktopValue: 10),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                directoryController.launchEmail(email);
                              },
                              child: Text(
                                email!,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.getAppTextStyleCustomized(
                                  textWeight: FontWeight.w600,
                                  textSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
