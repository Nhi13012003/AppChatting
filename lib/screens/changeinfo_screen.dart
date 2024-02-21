import 'package:appchat/controllers/profile_controller.dart';
import 'package:appchat/detail/user.dart';
import 'package:appchat/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeInfoScreen extends StatelessWidget{
  final controller=Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.more_vert_rounded,
            color: Colors.black,)
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 20,),
           Form(
             child: Column(
               children: [
                 TextFormField(
                   controller: controller.hoTen,
                   decoration: InputDecoration(
                     label: Text("Họ và tên"),
                     prefixIcon: Icon(Icons.person_2_rounded),
                     border: OutlineInputBorder()
                   ),
                 ),
                 SizedBox(height: 10,),
                 TextFormField(
                   controller: controller.gioiTinh,
                   decoration: InputDecoration(
                       label: Text("Giới tính"),
                       prefixIcon: Icon(Icons.monitor_heart_rounded),
                       border: OutlineInputBorder()
                   ),
                 ),
                 SizedBox(height: 10,),
                 TextFormField(
                   controller: controller.ngaySinh,
                   decoration: InputDecoration(
                       label: Text("Ngày sinh"),
                       prefixIcon: Icon(Icons.date_range_rounded),
                       border: OutlineInputBorder()
                   ),
                 ),
                 SizedBox(height: 10,),
                 TextFormField(
                   controller: controller.email,
                   decoration: InputDecoration(
                       label: Text("Email"),
                       prefixIcon: Icon(Icons.email_rounded),
                       border: OutlineInputBorder()
                   ),
                 ),
               ],
             ),
           ),
            SizedBox(height: 10,),
            TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  backgroundColor: Colors.black
                ),onPressed:saveInfo, child:
            Text("Lưu",style: TextStyle(
              color: Colors.white,fontSize: 20
            ),))
          ],
        ),
      )
    );
  }
  saveInfo()
  {
    UserDetails user=UserDetails(hoTen:controller.hoTen.text.toString().trim(),
        gioiTinh:controller.gioiTinh.text.toString().trim(),
        ngaySinh:controller.ngaySinh.text.toString().trim(),
        email:controller.email.text.toString().trim(), isOnline: null, lastActive: '', img_url: '');
    Get.to(()=>ProfileScreen(),arguments: [
    controller.hoTen.text.toString(),
    controller.gioiTinh.text.toString(),
    controller.ngaySinh.text.toString(),
    controller.email.text.toString()]);
  }

}