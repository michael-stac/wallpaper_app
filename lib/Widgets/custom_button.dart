import 'package:flutter/material.dart';

import '../Styles/appcolors.dart';

Widget customButton(
    {required String text,
      Icon? icon,
      Function? onTap,
      Color? bgColor,
      TextStyle? textStyle,
      Color? textColor}) {
  return GestureDetector(
    onTap: onTap as void Function()?,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.primaryColor, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon ?? const Text(''),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}