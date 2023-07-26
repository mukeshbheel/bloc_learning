import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 34),
          width: 345.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                  _page(
                    1,
                    context,
                    'Next',
                    'First See Learning',
                    'Forget about a for of paper all knowledge in one learning',
                    'image item',
                  ),
                  _page(
                    2,
                    context,
                    'Next',
                    'Connect With Everyone',
                    "Always keep in touch with your tutor & friends. Let's get connected!",
                    'image item',
                  ),
                  _page(
                    3,
                    context,
                    'Get Started',
                    'Always Facinated Learning',
                    'Anywhere, Anytime. The time is in your discretion so study whenever you want.',
                    'image item',
                  ),
                ],
              ),
              Positioned(
                bottom: 50.w,
                child: DotsIndicator(
                  dotsCount: 3,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    size: Size.square(8),
                    activeSize: Size(10, 8),
                    activeColor: Colors.blue,
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  Widget _page(int index, BuildContext context, String buttonName, String title, String subtitle, String imageUrl){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Text(imageUrl),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24.spMin,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 300.w,
          height: 50.w,
          margin: EdgeInsets.only(top: 100.w),
          decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 2,
                    spreadRadius: 1,
                    offset: Offset(0.w, 1.w)
                )
              ]
          ),
          child: Center(
            child: Text(buttonName,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontSize: 14.spMin,
              ),
            ),
          ),

        )
      ],
    );
  }
}
