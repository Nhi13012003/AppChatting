import 'package:appchat/controllers/auth_controller.dart';
import 'package:appchat/controllers/register_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailVerificationScreen extends StatelessWidget {
  var data =Get.arguments;
  @override
  Widget build(BuildContext context) {
  final controller=Get.put(AuthController());
  return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 24),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          onPressed: ()async {
            await controller.sendEmailVerification();
            controller.checkEmailVerificationStatus();
            },
          child: Text("Xác minh email của bạn",style: TextStyle(color: Colors.white),),
        ),
      )
    );
  }
}
