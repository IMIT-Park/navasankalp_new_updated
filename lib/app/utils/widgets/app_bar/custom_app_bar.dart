import 'package:flutter/material.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    Color? backgroundColor,
    Color? leadingIconColor,
    Color? actionIconColor,
    double? elevation,
    String? title,
    Color? titleColor,
    double? titleSize,
    IconData? leadingIconData,
    IconData? actionIconData,
    VoidCallback? onLeadingPressed,
    VoidCallback? onActionPressed,
    double? actionIconSize,
    double? leadingIconSize,
  }) : super(
          centerTitle: true,
          key: key,
          backgroundColor: backgroundColor ?? Colors.transparent,
          elevation: elevation ?? 0,
          title: title != null
              ? Text(
                  title,
                  style:AppTextStyles.base.s14.blackColor.w600
                )
              : null,
          actions: [
            if (actionIconData != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: IconButton(
                  onPressed: onActionPressed,
                  icon: Icon(
                    actionIconData,
                    color: actionIconColor ?? AppColors.white,
                    size: actionIconSize ?? 20.0,
                  ),
                ),
              ),
          ],
          leading: leadingIconData != null
              ? IconButton(
                  onPressed: onLeadingPressed,
                  icon: Icon(
                    leadingIconData,
                    color: leadingIconColor ?? AppColors.white,
                    size: leadingIconSize ?? 20.0,
                  ),
                )
              : null,
        );
}
