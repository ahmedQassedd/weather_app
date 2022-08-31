import 'package:flutter/material.dart';


void navigateAndFinish(
    {required BuildContext context, required Widget widget}) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}