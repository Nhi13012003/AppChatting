import 'package:appchat/consts/firebase_consts.dart';
import 'package:appchat/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:developer' as DevLog;
class LoginController extends GetxController{
  final auth=FirebaseAuth.instance;
  static LoginController get instance =>Get.find();
  final email=TextEditingController();
  final password=TextEditingController();
  GlobalKey<FormState> loginFormKey=GlobalKey<FormState>();
  Future<void> LoginAccount(String email,String password) async{
    UserCredential userCredential =await auth.signInWithEmailAndPassword(email: email, password: password);
   User? user=userCredential.user;
    if(user!=null&&user.emailVerified)
      {
        Get.to(()=>HomeScreen());
      }
    else print("Loi roi");
  }
}