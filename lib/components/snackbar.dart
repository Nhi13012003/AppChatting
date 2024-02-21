import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeSnackBar
{
  static sucessSnackBar({required title,message='',duration=3})
  {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade600,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(20),
      icon: Icon(Icons.check,color: Colors.white,)
    );
  }
  static errorSnackBar({required title,message='',duration=3})
  {
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: Colors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.all(20),
        icon: Icon(Icons.cancel_outlined,color: Colors.white,)
    );
  }
}