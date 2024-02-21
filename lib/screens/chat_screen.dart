import 'package:appchat/controllers/login_controller.dart';
import 'package:appchat/controllers/message_controller.dart';
import 'package:appchat/detail/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget{
  final messageController=Get.put(MessageController());
List<Message> listMessage=[];
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  backgroundColor: CupertinoColors.white,
    appBar: AppBar(
      actions: [
        Icon(Icons.more_vert_rounded,
        color: Colors.black,)
      ],
    ),
    body: StreamBuilder(
      stream: messageController.allMessage(LoginController.instance.email.text.toString()),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done)
          {
            if(snapshot.hasData)
              {
                final data=snapshot.data!.docs;
                listMessage=data.map((e) => Message.fromJson(e.data())).toList();
                return Container(
                  margin: EdgeInsets.only(right: 16,left: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top:
                      Radius.circular(16))
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: "Username\n",
                                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
                                              color: Colors.black)
                                      ),
                                      TextSpan(
                                          text: "Vừa mới truy cập",
                                          style: TextStyle(fontSize: 10,color: Colors.black
                                          )
                                      )
                                    ]
                                ),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: IconButton(
                                  onPressed:(){},
                                  icon: Icon(Icons.video_call_rounded,
                                    color: Colors.white,)),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              child: IconButton(
                                  onPressed:(){},
                                  icon: Icon(Icons.call,
                                    color: Colors.white,)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listMessage.length,
                            itemBuilder:(BuildContext context, int index) {
                              return Directionality(
                                textDirection: index.isEven?TextDirection.rtl:TextDirection.ltr,
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: index.isEven?Colors.black:Colors.orange,
                                        child: Icon(Icons.woman_sharp,color: Colors.white,),
                                      ),
                                      SizedBox(width: 20,),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Expanded(
                                          child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration:BoxDecoration(
                                              color: index.isEven?Colors.black:Colors.orange,
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: Text(
                                              listMessage[index].message,
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      TextButton.icon(onPressed: () {  },
                                        icon: Icon(Icons.access_time_filled_rounded,
                                          color: Colors.grey,), label:Text("11:20 AM"),


                                      )
                                    ],
                                  ),
                                ),
                              );
                            }
                        ),
                        SizedBox(height: 20,),
                        SizedBox(
                            height: 40,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      cursorColor: Colors.white,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.emoji_emotions_rounded,color: Colors.grey,),
                                        suffixIcon: Icon(Icons.attach_file_rounded,color: Colors.grey,),
                                        hintText: "Nhập tin nhắn ở đây",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  CircleAvatar(
                                    backgroundColor: Colors.orange,
                                    child: Icon(Icons.send),
                                  )
                                ],
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                );
              }
            else if(snapshot.hasError)
              {
                return Center(child: Text("Đang gặp lỗi ${snapshot.error.toString()}"),);
              }
            else return Center(child: Text("Đang gặp lỗi dữ liệu"),);
          }
        else return CircularProgressIndicator();
      }
    ),
  );
  }
  
}