import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/responsive_text.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
        height: 1.w,
      ),
    ),
    centerTitle: true,
    title: ResponsiveText(
      'Log In',
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black,
      ),
    ),
  );
}

//need context for the bloc
Widget buildThirdPartyLoginWidget(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons('google'),
        _reusableIcons('apple'),
        _reusableIcons('facebook'),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset('assets/icons/${iconName}.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    child: ResponsiveText(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.normal,
        color: Colors.grey.withOpacity(0.5),
      ),
    ),
  );
}

Widget buildTextFieldwithIcon(String hintText, String fieldType, String fieldIcon,) {
  return Container(
    margin: const EdgeInsets.only(top: 10),
    width: 345.w,
    height: 50.h,
    // color: Colors.blueAccent,
    decoration: BoxDecoration(
        // color: Colors.lightBlue,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(0.5))),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          width: 20.w,
          height: 20.h,
          child: Image.asset('assets/icons/$fieldIcon.png'),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: 255.w,
          child: TextField(
            // keyboardType: TextInputType.multiline,
            obscureText: fieldType == 'password',
            style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                fontFamily: "Avenir",
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: Colors.grey.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Avenir"),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
              ),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
              ),

            ),
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword(){
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: GestureDetector(
      child: ResponsiveText(
        'Forgot password',
        style: TextStyle(
          fontSize: 12.sp,
          color: Colors.black,
          decoration: TextDecoration.underline,
          decorationColor: Colors.blue,
        ),
      ),
    ),
  );
}
