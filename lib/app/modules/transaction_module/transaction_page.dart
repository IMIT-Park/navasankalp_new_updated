import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:navasankalp_application/app/modules/transaction_module/transaction_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_bar/custom_app_bar.dart';

class TransactionPage extends GetWidget {
  const TransactionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingIconData: NavaSankalp.back,
        leadingIconColor: AppColors.black,
        actionIconColor: AppColors.black,
        actionIconSize: Common.getDeviceSepcificDouble(18, desktopValue: 11),
        leadingIconSize: Common.getDeviceSepcificDouble(20, desktopValue: 17),
        title: "Transaction",
        titleSize: Common.getDeviceSepcificDouble(15, desktopValue: 11),
        onLeadingPressed: () => Get.close(1),
      ),
      body: transactionPageBody(),
    );
  }
}

Widget transactionPageBody() {
  TransactionController transactionController =
      Get.find<TransactionController>();
  if (transactionController.transactionList.isEmpty) {
    return Center(
      child: Image.asset(
        'assets/No_Transaction.gif',
        width: 200,
        height: 200,
      ),
    );
  }
  return Obx(
    () => ListView.builder(
      padding: const EdgeInsets.all(4),
      itemBuilder: (context, index) {
        return getTransactionTile(
          paymentId:
              transactionController.transactionList[index].paymentId.toString(),
          amount:
              transactionController.transactionList[index].amount.toString(),
          // ignore: unrelated_type_equality_checks
          status: transactionController.transactionList[index].status == 0
              ? false
              : true,
          date: "${DateFormat('MMM d, y').format(
            DateTime.parse(
              transactionController.transactionList[index].createdAt.toString(),
            ),
          )} at ${DateFormat('h:mm a').format(
            DateTime.parse(
              transactionController.transactionList[index].createdAt.toString(),
            ),
          )}",
        );
      },
      itemCount: transactionController.transactionList.length,
    ),
  );
}

Widget getTransactionTile({
  required String paymentId,
  required String amount,
  required bool status,
  required String date,
}) {
  return Padding(
    padding: const EdgeInsets.all(6.0),
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          padding: EdgeInsets.only(
            left: Common.getDeviceSepcificDouble(20, desktopValue: 16),
            right: Common.getDeviceSepcificDouble(20, desktopValue: 14),
            top: Common.getDeviceSepcificDouble(status ? 20 : 25,
                desktopValue: status ? 5 : 10),
            bottom: Common.getDeviceSepcificDouble(status ? 20 : 25,
                desktopValue: status ? 5 : 18),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.03),
                offset: const Offset(1, 1),
                blurRadius: 3,
                spreadRadius: 2,
              ),
            ],
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      NavaSankalp.arrow_up_icon,
                      size:
                          Common.getDeviceSepcificDouble(20, desktopValue: 18),
                      weight: 2,
                      color: status ? AppColors.lightgreen : AppColors.darkred,
                    ),
                    SizedBox(
                        width: Common.getDeviceSepcificDouble(18,
                            desktopValue: 14)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          status
                              ? Text(
                                  "Payment ID",
                                  style:
                                      AppTextStyles.getAppTextStyleCustomized(
                                    textSize: Common.getDeviceSepcificDouble(11,
                                        desktopValue: 10),
                                    textColor: AppColors.black,
                                    textWeight: FontWeight.w400,
                                  ),
                                )
                              : const SizedBox(),
                          Text(
                            paymentId,
                            style: AppTextStyles.getAppTextStyleCustomized(
                              textSize: Common.getDeviceSepcificDouble(14,
                                  desktopValue: 11),
                              textColor: AppColors.black,
                              textWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            date,
                            style: AppTextStyles.getAppTextStyleCustomized(
                              textSize: Common.getDeviceSepcificDouble(10,
                                  desktopValue: 8),
                              textColor: AppColors.black.withAlpha(102),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '+$amount',
                      style: AppTextStyles.getAppTextStyleCustomized(
                        textSize: Common.getDeviceSepcificDouble(19,
                            desktopValue: 15),
                        textColor: status
                            ? AppColors.lightgreen
                            : AppColors.red.withAlpha(77),
                        textWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        status
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(
                  bottom: Common.getDeviceSepcificDouble(17, desktopValue: 12),
                  right: Common.getDeviceSepcificDouble(25, desktopValue: 18),
                ),
                child: Text(
                  "Transaction Falied",
                  style: AppTextStyles.getAppTextStyleCustomized(
                    textColor: AppColors.darkred,
                    textWeight: FontWeight.w400,
                    textSize:
                        Common.getDeviceSepcificDouble(11, desktopValue: 9),
                  ),
                ),
              ),
      ],
    ),
  );
}
