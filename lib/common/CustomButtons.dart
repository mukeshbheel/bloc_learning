import 'package:bloc_learning/common/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget signInbuttons({
  required Function onPressed,
  String text = 'buttonText',
  double width = 120,
  double height = 44,
  Color textColor = Colors.white,
  Color bgColor = Colors.blue,
  double borderRadius = 15,
  double elevation = 0,
  Color borderColor = Colors.transparent,
}){
  return SizedBox(
    width: width.w,
    height: height.h,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(
            color: borderColor
          )
        )
      ),
      onPressed: (){},
      child: ResponsiveText(
        text,
        style: TextStyle(
          color: textColor,
        )
      ),
    ),
  );
}