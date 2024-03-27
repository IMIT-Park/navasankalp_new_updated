import 'package:flutter/material.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/utils/widgets/app_button/base_button.dart';
class AppButton extends StatelessWidget {
  late final bool isOutline;
  final String? text;
  final double? textSize;
  final FontWeight? textWeight;
  final VoidCallback? onPressed;
  final Color color;
  final TextStyle? style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double space;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
 // Renamed the parameter
  AppButton({
    Key? key,
    required this.onPressed,
    this.text,
    this.textSize,
    this.textWeight,
    this.color = AppColors.kPrimaryColor,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
    this.space = 12,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius,
   // Renamed the parameter
  }) : super(key: key) {
    isOutline = false;
  }
  AppButton.outline({
    Key? key,
    required this.onPressed,
    this.text,
    this.textSize,
    this.textWeight,
    this.color = AppColors.kPrimaryColor,
    this.style,
    this.prefixIcon,
    this.suffixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
    this.margin = const EdgeInsets.symmetric(horizontal: 16),
   this.space = 12,
    this.height = 48,
    this.width = double.infinity,
    this.borderRadius,
     // Renamed the parameter
  }) : super(key: key) {
    isOutline = true;
  }
  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle = style ??
        AppTextStyles.getAppTextStyleCustomized(
          textSize: textSize ?? 20,
          textWeight: textWeight ?? FontWeight.w500,
          textColor: AppColors.white,
        );
    return Padding(
      padding: margin,
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(48),
        child: BaseButton(
          onPressed: onPressed,
          color: isOutline ? AppColors.transparent : color,
          child: Container(
            height: height,
            width: width,
            padding: padding,
            decoration: BoxDecoration(
              border: Border.all(
                color: onPressed != null ? color : color.withOpacity(0.4),
              ),
              borderRadius: borderRadius ?? BorderRadius.circular(6),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (prefixIcon != null)
                  Padding(
                    padding: EdgeInsets.only(right: text == null ? 0 : space),
                    child: prefixIcon!,
                  ),
                if (text != null)
                  Text(
                    text ?? "",
                    style: isOutline
                        ? defaultStyle.copyWith(color: AppColors.black)
                        : defaultStyle,
                  ),
                if (suffixIcon != null)
                  Padding(
                    padding: EdgeInsets.only(right: text == null ? 0 : space),
                    child: suffixIcon!,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}