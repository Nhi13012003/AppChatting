import 'package:appchat/consts/firebase_consts.dart';
import 'package:appchat/controllers/login_controller.dart';
import 'package:appchat/detail/message.dart';
import 'package:appchat/detail/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MessageController extends GetxController{
  static MessageController get instance=>Get.find();
  Stream<QuerySnapshot<Map<String,dynamic>>> allMessage(String email)
  {
    return firebaseFirestore.collection(collectionMessage)
        .snapshots();
  }
  Future<void> sendMessage(UserDetails userDetails,String msg) async
  {
    final timeSend=DateTime.now().millisecondsSinceEpoch.toString();

    final Message message=Message(
        fromUser: LoginController.instance.email.toString(),
        toUser: userDetails.email,
        message: msg,
        type: '',
        read: '',
        write:timeSend);
    final ref=firebaseFirestore.collection(collectionMessage);
    await ref.doc(timeSend).set(message.toJson());
  }
}