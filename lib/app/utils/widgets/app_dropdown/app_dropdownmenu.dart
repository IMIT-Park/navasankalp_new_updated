import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navasankalp_application/app/themes/app_colors.dart';
import 'package:navasankalp_application/app/utils/common.dart';
import 'package:navasankalp_application/app/utils/nava_sankalp_icons.dart';
class CustomDropdownMenu<T> extends StatelessWidget {
  final T? value;
  final void Function(T?) onChanged;
  final String? label;
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;
  final bool enabled;
  final String? errorText;
  final InputBorder? errorBorder;
  final String? hint;
  final String? helpertext;
  final TextEditingController? controller;
  final TextStyle? textStyle;

  const CustomDropdownMenu({
    super.key,
    this.value,
    required this.onChanged,
    this.label,
    required this.enabled,
    required this.dropdownMenuEntries,
    this.errorText,
    this.errorBorder,
    this.hint,
    this.helpertext,
    this.controller,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: DropdownMenu<T>(
        textStyle: textStyle,
        controller: controller,
        errorText: errorText,
        enabled: enabled,
        width: Get.width /
            Common.getDeviceSepcificDouble(1.12, desktopValue: 1.04),
        enableSearch: false,
        initialSelection: value,
        trailingIcon: const Icon(NavaSankalp.arrow_downwards),
        helperText: helpertext,
        hintText: hint,
        label: Text(label.toString()),
        dropdownMenuEntries: dropdownMenuEntries,
        inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            errorBorder: errorBorder,
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey))),
        onSelected: onChanged,
      ),
    );
  }
}
