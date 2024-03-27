import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/data/model/blocklist_model.dart';
import 'package:navasankalp_application/app/data/model/district_model.dart';
import 'package:navasankalp_application/app/data/model/mandalamlist_model.dart';
import 'package:navasankalp_application/app/modules/account_module/account_controller.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/constants.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/app_button.dart';
import 'package:navasankalp_application/app/utils/widgets/app_dropdown/app_dropdownmenu.dart';
import 'package:navasankalp_application/app/utils/widgets/app_text_field/app_text_field.dart';
import 'package:snap_scroll_physics/snap_scroll_physics.dart';

class AccountPage extends GetWidget<AccountController> {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accountController = Get.find<AccountController>();
    return Scaffold(

      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        physics: SnapScrollPhysics(
          snaps: [
            Snap(200, distance: 50),
            Snap(200, leadingDistance: 50),
            Snap(200, trailingDistance: 50),
            Snap(200, trailingDistance: 50),
            Snap.avoidZone(0, 200),
            Snap.avoidZone(0, 200, delimiter: 50),
          ],
        ),
        slivers: [
          Obx(
            () => SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                imagePath: accountController.imagePath.value,
              ),
            ),
          ),
          SliverPadding(
            sliver: accountBody(),
            padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: Common.getDeviceSepcificDouble(0, desktopValue: 50)),
          )
        ],
      ),
    );
  }
}

SliverList accountBody() {
  final accountController = Get.find<AccountController>();
  return SliverList(
    delegate: SliverChildListDelegate.fixed(
      [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: editIcon(),
          ),
        ),
        Obx(() => Form(
              key: accountController.nameformKey,
              child: AppTextField(
                hintText: "Enter your name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Please enter name';
                  } else if (value.length < 3 || value.length > 20) {
                    return '*Name should be at least 3 characters long & should not longer that 10 characters';
                  } else if (!RegExp(r'^[a-zA-Z\s.]+$').hasMatch(value)) {
                    return 'Please enter only letters';
                  }

                  return null;
                },
                enabled: accountController.isEditing.value,
                controller: accountController.nameController,
                textfieldheading: "Name",
                prefixIcon: accountController.isEditing.value
                    ? const Icon(
                        NavaSankalp.nameicon,
                        size: 20,
                        color: AppColors.black,
                      )
                    : const Icon(
                        NavaSankalp.nameicon,
                        size: 20,
                        color: AppColors.grey,
                      ),
                keyboardType: TextInputType.name,
              ),
            )),
        Obx(() => Form(
              key: accountController.addressformKey,
              child: AppTextField(
                hintText: "Enter your address",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Please enter address';
                  } else if (value.length < 5) {
                    return '*Address should be at least 5 characters long';
                  }
                  return null;
                },
                enabled: accountController.isEditing.value,
                controller: accountController.addressController,
                textfieldheading: "Address",
                prefixIcon: accountController.isEditing.value
                    ? const Icon(
                        NavaSankalp.address_icon,
                        size: 18,
                        color: AppColors.black,
                      )
                    : const Icon(
                        NavaSankalp.address_icon,
                        size: 18,
                        color: AppColors.grey,
                      ),
                keyboardType: TextInputType.streetAddress,
              ),
            )),
        AppTextField(
          enabled: false,
          controller: accountController.phoneController,
          textfieldheading: "Email Id",
          prefixIcon: accountController.isEditing.value
              ? const Icon(
                  NavaSankalp.mobile_icon,
                  size: 20,
                  color: AppColors.black,
                )
              : const Icon(
                  NavaSankalp.mobile_icon,
                  size: 20,
                  color: AppColors.grey,
                ),
        ),
        SizedBox(
          height: Common.getDeviceSepcificDouble(20, desktopValue: 28),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Party Position",
              style: AppTextStyles.base.grayColor.s12.poppins,
            ),
          ],
        ),
        const Divider(
          color: AppColors.grey,
        ),
        Obx(() => CustomDropdownMenu<DistrictModel>(
              controller: accountController.districtController,
              textStyle: accountController.isEditing.value
                  ? AppTextStyles.base.blackColor.s14
                  : AppTextStyles.base.lightgrayColor.s14,
              enabled: accountController.isEditing.value,
              dropdownMenuEntries:
                  accountController.districtlists.map((element) {
                return DropdownMenuEntry<DistrictModel>(
                    value: element, label: element.district ?? "");
              }).toList(),
              value: accountController.districts.value,
              onChanged: (value) {
                accountController.districts.value = value!;
                accountController.getBlocklist();
                accountController.enableBlock(true);
              },
              label: "District Committee",
            )),
        Obx(() => CustomDropdownMenu<int>(
              textStyle: accountController.isEditing.value
                  ? AppTextStyles.base.blackColor.s14
                  : AppTextStyles.base.lightgrayColor.s14,
              enabled: accountController.isEditing.value,
              dropdownMenuEntries: accountController.boothlist.map((element) {
                return DropdownMenuEntry(
                    value: element, label: element.toString());
              }).toList(),
              value: accountController.booth.value,
              onChanged: (value) {
                accountController.booth.value = value!;
              },
              label: "Booth Committee",
            )),
        Obx(() => CustomDropdownMenu<BlockModel>(
            controller: accountController.blockController,
            textStyle: accountController.isEditing.value
                ? AppTextStyles.base.blackColor.s14
                : AppTextStyles.base.lightgrayColor.s14,
            enabled: accountController.isEnabled.value &&
                accountController.isEditing.value,
            dropdownMenuEntries: accountController.blocklists.map((element) {
              return DropdownMenuEntry<BlockModel>(
                  value: element, label: element.name ?? "");
            }).toList(),
            value: accountController.block.value,
            onChanged: (values) {
              accountController.block.value = values!;
              accountController.getMandalamList();
              accountController.enableMandalam(true);
            },
            label: "Block Committee")),
        Obx(() => CustomDropdownMenu<MandalamModel>(
            controller: accountController.mandalamController,
            textStyle: accountController.isEditing.value
                ? AppTextStyles.base.blackColor.s14
                : AppTextStyles.base.lightgrayColor.s14,
            enabled: accountController.isEnabled.value &&
                accountController.isEditing.value,
            dropdownMenuEntries: accountController.mandalamlist.map((element) {
              return DropdownMenuEntry<MandalamModel>(
                  value: element, label: element.name ?? "");
            }).toList(),
            value: accountController.mandalam.value,
            onChanged: (value) {
              accountController.mandalam.value = value!;
            },
            label: "Mandalam Committee")),
        SizedBox(height: Common.getDeviceSepcificDouble(20, desktopValue: 130))
      ],
    ),
  );
}

AppButton editIcon() {
  final accountController = Get.find<AccountController>();
  return AppButton(
    onPressed: () async {
      accountController.toggleEditing();
      accountController.editIconValue.value = accountController.isEditing.value
          ? NavaSankalp.done
          : NavaSankalp.edit;
      if (accountController.nameformKey.currentState!.validate() ||
          accountController.addressformKey.currentState!.validate()) {
        await accountController.postAccountData();
        Common.showSuccess("Updated successfully");
      }
    },
    width: Common.getDeviceSepcificDouble(30, desktopValue: 33),
    height: Common.getDeviceSepcificDouble(30, desktopValue: 33),
    borderRadius: BorderRadius.circular(5),
    color: AppColors.kPrimaryColor,
    suffixIcon: Obx(() => Icon(
          accountController.editIconValue.value,
          size: 15,
        )),
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
  );
}

Widget avatarWidget(double radius, double profileiconsize, double plusiconsize,
    double opacity, String imageURL) {
  AccountController accountController = Get.find();

  return Opacity(
    opacity: opacity,
    child: Stack(
      alignment: Alignment.bottomRight,
      children: [
        Material(
          elevation: 10,
          shape: const CircleBorder(),
          child: GestureDetector(
            onTap: () async {
              accountController.isEditing.value
                  ? await accountController.openImagePicker()
                  : null;
            },
            child: imageURL.isNotEmpty
                ? CircleAvatar(
                    backgroundImage: accountController.isEditing.value
                        ? Image.file(File(imageURL)).image
                        : Image.network("${EndPoints.assetBaseUrl}$imageURL")
                            .image,
                    backgroundColor: AppColors.white,
                    radius: radius,
                  )
                : CircleAvatar(
                    backgroundColor: AppColors.white,
                    radius: radius,
                    child: Icon(
                      NavaSankalp.profile,
                      size: profileiconsize,
                      color: AppColors.grey.withOpacity(0.2),
                    ),
                  ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: Common.getDeviceSepcificDouble(8, desktopValue: 12)),
          child: Material(
            color: AppColors.appPrimarySwatch,
            shape: const CircleBorder(),
            child: Obx(() => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: accountController.isEditing.value
                      ? Icon(
                          NavaSankalp.edit,
                          color: AppColors.white,
                          size: plusiconsize,
                        )
                      : Icon(
                          NavaSankalp.plus_icon,
                          color: AppColors.white,
                          size: plusiconsize,
                        ),
                )),
          ),
        ),
      ],
    ),
  );
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final String imagePath;
  final bool hideTitleWhenExpanded = true;

  CustomSliverDelegate({required this.imagePath}) : super();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = maxExtent - shrinkOffset;
    final proportion = 2 - (maxExtent / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;

    return Stack(
      children: [
        SizedBox(
          height: Common.getDeviceSepcificDouble(170, desktopValue: 150),
        ),
        Container(
          height: Common.getDeviceSepcificDouble(170, desktopValue: 120) *
                      percent >
                  minExtent
              ? Common.getDeviceSepcificDouble(170, desktopValue: 120) * percent
              : minExtent,
          decoration: const BoxDecoration(
              gradient: AppColors.accountgradiantcolor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          child: AppBar(
            flexibleSpace: AnimatedOpacity(
              opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
              duration: const Duration(milliseconds: 200),
              child: Padding(
                padding: EdgeInsets.only(
                    right: Common.getDeviceSepcificDouble(30, desktopValue: 20),
                    top: Common.getDeviceSepcificDouble(40, desktopValue: 10)),
                child: Align(
                  alignment: Alignment.topRight,
                  child: avatarWidget(
                    Common.getDeviceSepcificDouble(16, desktopValue: 15),
                    15,
                    3,
                    1 - percent,
                    imagePath,
                  ),
                ),
              ),
            ),
            centerTitle: true,
            backgroundColor: AppColors.transparent,
            leading: IconButton(
              icon: Icon(
                NavaSankalp.back,
                size: Common.getDeviceSepcificDouble(18, desktopValue: 15),color: AppColors.white,
              ),
              onPressed: () {
                Navigator.pop(Get.overlayContext!);
              },
            ),
            elevation: 0.0,
            title: Text(
              "Account",
              style: AppTextStyles.base.whiteColor.s14.w400,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: avatarWidget(
              Common.getDeviceSepcificDouble(22.5, desktopValue: 25) *
                  percent *
                  2,
              Common.getDeviceSepcificDouble(20) * percent * 2,
              Common.getDeviceSepcificDouble(5) * percent * 2,
              percent,
              imagePath),
        )
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  @override
  double get maxExtent =>
      Common.getDeviceSepcificDouble(200, desktopValue: 170);

  @override
  double get minExtent => Common.getDeviceSepcificDouble(90, desktopValue: 55);
}
