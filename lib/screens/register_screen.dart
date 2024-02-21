import 'package:appchat/controllers/auth_controller.dart';
import 'package:appchat/controllers/register_controller.dart';
import 'package:appchat/detail/validators.dart';
import 'package:appchat/screens/login_screen.dart';
import 'package:appchat/screens/mailverification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RegisterScreen extends StatefulWidget {  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen>{
  @override
  Widget build(BuildContext context) {
    final controller=Get.put(RegisterController());
    return Scaffold(
      backgroundColor: Colors.white,
        body:
    Form(
      key: controller.registerFormKey,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Expanded(child: Container(
              child: Image.asset("assets/logo/Chatting_logo.png"),
            )),
            Container(
              child: TextFormField(
                validator: (value)=>Validators.validateEmail(value),
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
                validator: (value)=>Validators.validatePassword(value),
                controller: controller.password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Nhập mật khẩu của bạn",
                    prefixIcon: Icon(Icons.key_off_rounded)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: TextFormField(
                validator: (value)=>Validators.validateConfirmPassword(controller.password.text.toString(), value),
                controller: controller.confirmPassword,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    hintText: "Xác nhận lại mật khẩu của bạn",
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
                onPressed: () async {
                  if(controller.registerFormKey.currentState!.validate())
                    {
                      await controller.registerAccount(controller.email.text.toString(),
                      controller.password.text.toString());
                      Get.to(()=>MailVerificationScreen(),arguments:controller.email.text.toString());
                    }

                },
                child: Text("Đăng ký",style: TextStyle(color: Colors.white,
                    fontSize: 18),),
              ),),
            SizedBox(height: 10,),
            Container(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Bạn đã có tái khoản?",style: TextStyle(
                    fontSize: 16,fontWeight: FontWeight.w500
                ),),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>LoginScreen());
                  },
                  child: Text("  Đăng nhập",style: TextStyle(
                      color:Colors.deepPurple,
                      fontSize: 16,fontWeight: FontWeight.bold
                  ),),
                ),
              ],
            ),),
            SizedBox(height: 20,)
          ],
        ),
      ),
    ));
  }

}
