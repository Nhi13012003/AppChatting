import 'dart:convert';

import 'package:get/get.dart';

class Message
{
  late String fromUser;
  late String toUser;
  late String message;
  late String type;
  late String read;
  late String write;
  Message({
    required this.fromUser,
    required this.toUser,
    required this.message,
    required this.type,
    required this.read,
    required this.write
});
  toJson()
  {
    return {
      "FromUser":fromUser,
      "ToUser":toUser,
      "Messsage":message,
      "Type":type,
      "Read":read,
      "Write":write,
    };
  }
  Message.fromJson(Map<String,dynamic> json)
  {
   toUser=json["ToUser"].toString();
   fromUser=json["FromUser"].toString();
   message=json["Message"].toString();
   type=json["Type"].toString();
   read=json["Read"].toString();
   write=json["Write"].toString();
    
  }

}