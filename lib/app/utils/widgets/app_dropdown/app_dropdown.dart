// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:navasankalp/app/themes/app_colors.dart';
// import 'package:navasankalp/app/utils/common.dart';
// import 'package:navasankalp/app/utils/nava_sankalp_icons.dart';

// class DropDownButton<T> extends GetWidget {
//   final List<DropdownMenuItem<T>>? items;
//   final T currentValue;
//   final Function(T?) onChanged;
//   final String? title;
//   final dropdownValue = Rx<T?>(null);
//   DropDownButton({
//     Key? key,
//     required this.items,
//     required this.currentValue,
//     required this.onChanged,
//     this.title,
//   }) : super(key: key) {
//     dropdownValue.value = currentValue;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => DropdownButtonFormField<T>(
//           disabledHint: Text(title.toString()),
//           value: dropdownValue.value,
//           hint: const Text('Dropdown'),
//           isExpanded: true,
//           iconSize: Common.getDeviceSepcificDouble(20, desktopValue: 30.0),
//           icon: const Icon(NavaSankalp.arrow_downwards),
//           style: const TextStyle(color: AppColors.grey),
//           items: items,
//           onChanged: (T? value){
//             dropdownValue.value = value;
//             onChanged(value);
//           },
//         ));
//   }
// }

// // Pass items in the below manner
// // items.map((T val) {
// //             return DropdownMenuItem<T>(
// //               value: val,
// //               child: Text(val, style: TextStyle(color: textcolor)),
// //             );
// //           }).toList()

