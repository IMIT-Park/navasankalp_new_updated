import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';

class CustomAppCard extends GetWidget {
  const CustomAppCard({
    Key? key,
    required this.cardtitle,
    required this.cardcontent,
    required this.cardaction,
  }) : super(key: key);

  final String cardtitle;
  final String cardcontent;
  final VoidCallback cardaction;

  @override
  Widget build(BuildContext context) {
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
                  style: AppTextStyles.base.w900.s12.poppins,
                ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(7, desktopValue: 7),
                ),
                Text(
                  cardcontent,
                  maxLines: 8,
                  textScaleFactor: 1,
                  style: TextStyle(
                      height: 1.5,
                      fontFamily: AppTextStyles.base.poppins.toString(),
                      color: AppColors.black.withAlpha(178),
                      fontSize:
                          Common.getDeviceSepcificDouble(12, desktopValue: 10),
                      fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: Common.getDeviceSepcificDouble(5, desktopValue: 5),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: Common.getDeviceSepcificDouble(4),
                    bottom:
                        Common.getDeviceSepcificDouble(12, desktopValue: 10),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: cardaction,
                      child: Text(
                        "More",
                        textScaleFactor: 0.9,
                        style: TextStyle(
                          fontFamily: AppTextStyles.base.poppins.toString(),
                          color: AppTextStyles.base.color,
                          fontSize: Common.getDeviceSepcificDouble(12,
                              desktopValue: 12),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
