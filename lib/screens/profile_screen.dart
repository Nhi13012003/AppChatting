import 'dart:io';

import 'package:appchat/components/imagepicker_dialog.dart';
import 'package:appchat/controllers/profile_controller.dart';
import 'package:appchat/screens/changeinfo_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import '../detail/user.dart';
import 'dart:developer' as DevLog;

class ProfileScreen extends StatelessWidget{
  final controller=Get.put(ProfileController());
  final loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: 24,left: 24,top: 24),
        child: FutureBuilder(
          future: controller.getUserData(),
          builder: (context,snapshot)
          {
            if(snapshot.connectionState==ConnectionState.done)
              {
                if (snapshot.hasData) {
                  UserDetails user=snapshot.data as UserDetails;
                  controller.imgPath.value=user.img_url;
                  return Container(
                    child: Column(
                      children: [
                        Obx(
                                ()=>CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 80,
                              child: Stack(
                                children: [
                                    ClipOval(child: CachedNetworkImage(
                                    imageUrl: controller.imgPath.value,fit: BoxFit.cover,
                                      height: 160,width: 160,)),
                                  Positioned(
                                    right: 10,bottom:10,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.black,
                                      child: GestureDetector(
                                          onTap: ()=>Get.dialog(ImagePickerDialog(context,controller)),
                                          child: Icon(Icons.camera_alt_rounded,color: Colors.white,)),
                                    ),
                                  )
                                ],
                              ),
                            )
                        ),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Giới tính",style: TextStyle(fontSize: 15,
                                    color: Colors.grey),),
                                Text("Họ và tên",style: TextStyle(fontSize: 15,
                                    color: Colors.grey),),
                                Text("Ngày sinh",style: TextStyle(fontSize: 15,
                                    color: Colors.grey),),
                                Text("Email",style: TextStyle(fontSize: 15,
                                    color: Colors.grey),)
                              ],),
                            Expanded(child: Container()),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user.hoTen,style: TextStyle(fontSize: 15,
                                    color: Colors.black),),
                                Text(user.gioiTinh,style: TextStyle(fontSize: 15,
                                    color: Colors.black),),
                                Text(user.ngaySinh,style: TextStyle(fontSize: 15,
                                    color: Colors.black),),
                                Text(user.email,style: TextStyle(fontSize: 15,
                                    color: Colors.black),)
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        TextButton(
                          style:TextButton.styleFrom(
                              backgroundColor: Colors.black
                          ),
                          onPressed: () { Get.to(
                                  ()=>ChangeInfoScreen()); },
                          child: Text(
                            "Chỉnh sửa thông tin của bạn",
                            style: TextStyle(
                                color: Colors.white
                            ),
                          ),

                        )
                      ],
                    ),
                  );


                }
                else if(snapshot.hasError)
                  {
                    return Center(child: Text("Đang gặp lỗi ${snapshot.error.toString()}"));
                  }
                else return Center(child: Text("Lỗi dữ liệu"),);
              }

            else return Center(child: CircularProgressIndicator());
          },
        ),
      )
    );
  }

}