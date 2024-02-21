
import 'dart:io';
import 'package:appchat/components/snackbar.dart';
import 'package:appchat/consts/firebase_consts.dart';
import 'package:appchat/controllers/login_controller.dart';
import 'package:appchat/controllers/user_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import '../detail/user.dart';
import 'dart:developer' as DevLog;

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();
  //controller
  final userController=Get.put(UserController());
final hoTen=TextEditingController();
final gioiTinh=TextEditingController();
final ngaySinh=TextEditingController();
final email=TextEditingController();
Platform? file;
var imgPath=''.obs;
var imgUrl='';
Future<void>sendData(Map<String,dynamic> map) async
{

  QuerySnapshot querySnapshot=await firebaseFirestore.collection(collectionUser)
  .where("Email",isEqualTo: LoginController.instance.email.text.toString()
  ).get();
  if(querySnapshot.docs.isNotEmpty)
    {
      DocumentReference userRef=querySnapshot.docs[0].reference;
      await userRef.update(map);
      Get.snackbar("$userRef","Thanh cong");
    }
  else Get.snackbar("Loi", "Gui anh that bai");


}
getUserData()
{
  final email=LoginController.instance.email.text.toString();
  DevLog.log("Email dang dc su dung la $email");
  if(email!=null)
    {
      return userController.getUserDetails(email);
    }
  else
    {
      Get.snackbar("Error", "Đăng nhập để tiếp tục");
    }
}



selectImage(context,source) async
{
 final img= await ImagePicker().pickImage(source: source,imageQuality: 80);
 String fileName=DateTime.now().microsecondsSinceEpoch.toString();

 Reference referenceRoot=firebaseStorage.ref();
 Reference referenceImage=referenceRoot.child('images');
 Reference referenceUploadImg=referenceImage.child(fileName);
 try {
   await referenceUploadImg.putFile(File(img!.path));
   final url=await referenceUploadImg.getDownloadURL();
   sendData({"ImgUrl":url});
   imgPath.value=url;


 }
 catch(e)
 {
   Get.snackbar("Thông báo",'$e');
 }
}



}