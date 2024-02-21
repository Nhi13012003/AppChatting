import 'package:appchat/controllers/login_controller.dart';
import 'package:appchat/screens/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.loginFormKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset("assets/logo/Chatting_logo.png"),
                ),
              ),
              Container(
                child: TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Nhập email của bạn",
                    prefixIcon: Icon(Icons.email_rounded)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child: TextFormField(
                  controller: controller.password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      hintText: "Nhập mật khẩu của bạn",
                      prefixIcon: Icon(Icons.key_rounded)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                child:
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: 40,right: 40,bottom: 10,top: 10),
                    backgroundColor: Colors.deepPurple
                      ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                  onPressed: () {controller.LoginAccount(controller.email.text.toString(),
                  controller.password.text.toString());},
                  child: Text("Đăng nhập",style: TextStyle(color: Colors.white,
                  fontSize: 18),),
                ),),
              SizedBox(height: 10,),
              Container(child: Column(
                children: [
                  Text("Bạn chưa có tái khoản?",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.w500
                  ),),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>RegisterScreen());
                    },
                    child: Text("Đăng kí",style: TextStyle(
                      color:Colors.deepPurple,
                        fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Text("Quên mật khẩu",style: TextStyle(
                      color: Colors.deepPurple,
                        fontSize: 16,fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
