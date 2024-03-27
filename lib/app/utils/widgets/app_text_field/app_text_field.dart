import 'package:flutter/material.dart';
import 'package:navasankalp_application/app/themes/app_text_theme.dart';
import 'package:navasankalp_application/app/translations/app_translations.dart';
import 'package:navasankalp_application/app/utils/common.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.errorText,
    this.obscureText,
    this.prefixIcon,
    this.textfieldheading,
    this.hintText,
    this.textfieldheight,
    this.controller,
    this.validator,
    this.enabled,
    this.isMultiline = false,
    this.keyboardType,
  }) : super(key: key);

  final String? errorText;
  final bool? obscureText;
  final Icon? prefixIcon;
  final String? textfieldheading;
  final String? hintText;
  final String? textfieldheight;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? enabled;
  final bool isMultiline;
 final TextInputType? keyboardType;

  

  @override
  State<StatefulWidget> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.textfieldheading.toString(),
          style: AppTextStyles.base.blackColor.s12.poppins,
        ),
        SizedBox(
          height: Common.getDeviceSepcificDouble(45, desktopValue: 48),
          child: TextFormField(
            autovalidateMode: AutovalidateMode.always,
            enabled: widget.enabled,
            validator: widget.validator,
            controller: widget.controller,
            maxLines: widget.isMultiline ? null : 1,
            expands: widget.isMultiline,
            keyboardType:widget.keyboardType,
            cursorHeight: 18.0,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              prefixIconColor: Colors.grey,
              border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.grey,
              )),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              hintText: widget.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              hintStyle: AppTextStyles.base.lightgrayColor.s12.poppins,
            ),
          ),
        ),
        if (widget.errorText != null && widget.errorText!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              top: 4,
            ),
            child: Text(
              widget.errorText ?? AppTranslationKey.noEmpty,
              style: AppTextStyles.base.s14.redColor,
            ),
          ),
        SizedBox(height: Common.getDeviceSepcificDouble(12, desktopValue: 23)),
      ],
    );
  }
}
