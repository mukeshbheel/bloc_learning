import 'package:bloc_learning/common/values/colors.dart';
import 'package:bloc_learning/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/CustomButtons.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLoginWidget(context),
                Center(child: reusableText('Or use your email account login')),
                Container(
                  margin: EdgeInsets.only(top: 60.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      buildTextFieldwithIcon('Enter your email address', 'email', 'user'),
                      const SizedBox(height: 20,),
                      reusableText('Password'),
                      buildTextFieldwithIcon('Enter your password', 'password', 'lock'),
                      forgotPassword(),
                      const SizedBox(height: 80,),
                      signInbuttons(onPressed: (){}, text: 'Log In', width: 375.w, bgColor: ColorStyle.primaryButton, textColor: ColorStyle.primaryButtonText),
                      const SizedBox(height: 20,),
                      signInbuttons(onPressed: (){}, text: 'Register', width: 375.w, bgColor: ColorStyle.primaryButtonText, textColor: ColorStyle.primaryText, borderColor: ColorStyle.borderGrey),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
