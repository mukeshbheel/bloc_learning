import 'package:bloc_learning/common/values/colors.dart';
import 'package:bloc_learning/main.dart';
import 'package:bloc_learning/pages/welcome/welcome_blocs.dart';
import 'package:bloc_learning/pages/welcome/welcome_events.dart';
import 'package:bloc_learning/pages/welcome/welcome_states.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/responsive_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocs, WelcomeStates>(
          builder: (context, state){
            return Center(
              child: Container(
                margin: const EdgeInsets.only(top: 34),
                width: 345.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: pageController,
                      onPageChanged: (index){
                        state.page = index;
                        BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents());
                      },
                      children: [
                        _page(
                          1,
                          context,
                          'Next',
                          'First See Learning',
                          'Forget about a for of paper all knowledge in one learning',
                          'assets/images/reading.png',
                        ),
                        _page(
                          2,
                          context,
                          'Next',
                          'Connect With Everyone',
                          "Always keep in touch with your tutor & friends. Let's get connected!",
                          'assets/images/boy.png',
                        ),
                        _page(
                          3,
                          context,
                          'Get Started',
                          'Always Facinated Learning',
                          'Anywhere, Anytime. The time is in your discretion so study whenever you want.',
                          'assets/images/man.png',
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 50.w,
                      child: DotsIndicator(
                        position: state.page,
                        dotsCount: 3,
                        decorator: DotsDecorator(
                            color: ColorStyle.textGrey,
                            size: Size.square(8),
                            activeSize: Size(10, 8),
                            activeColor: ColorStyle.primaryButton,
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
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
          child: Image.asset(imageUrl),
        ),
        Container(
          child: ResponsiveText(
            title,
            style: TextStyle(
              fontSize: 24.spMin,
              color: ColorStyle.primaryText,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: ResponsiveText(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorStyle.primaryText.withOpacity(0.5),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            if(index < 3){
              pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.decelerate);
            }else{
              // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
              Navigator.of(context).pushNamedAndRemoveUntil('signIn', (route) => false);
            }
          },
          child: Container(
            width: 300.w,
            height: 50.w,
            margin: EdgeInsets.only(top: 100.w),
            decoration: BoxDecoration(
                color: ColorStyle.primaryButton,
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
              child: ResponsiveText(buttonName,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: ColorStyle.primaryButtonText,
                  fontSize: 14.spMin,
                ),
              ),
            ),

          ),
        )
      ],
    );
  }
}
