import 'package:appchat/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Đăng kí thành công",style: TextStyle(color: Colors.black),),
            TextButton(onPressed: (){Get.offAll(()=>LoginScreen());}, child: Text("Đi đến đăng nhập"))
          ],
        ),
      ),
    );
  }

}