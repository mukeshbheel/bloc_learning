import 'package:bloc_learning/pages/sign_in/widgets/sign_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                Center(child: reusableText('or use your email account login')),
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
