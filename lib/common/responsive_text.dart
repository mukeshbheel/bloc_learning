import 'package:flutter/cupertino.dart';

Widget ResponsiveText(String text, {TextStyle style = const TextStyle()}){
  return RichText(
    text: TextSpan(
      text: text,
      style: style
    ),
  );
}