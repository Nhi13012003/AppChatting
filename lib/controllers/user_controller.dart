import 'package:appchat/consts/firebase_consts.dart';
import 'package:get/get.dart';

import '../detail/user.dart';

class UserController extends GetxController
{
  static UserController get instance => Get.find();
  Future<UserDetails> getUserDetails(String email) async{
  final snapshot=await firebaseFirestore.collection(collectionUser)
      .where("Email",isEqualTo: email).get();
  final userData=snapshot.docs.map((e) => UserDetails.fromSnapshot(e)).single;
  return userData;
  }
  Future<List<UserDetails>> allUser() async{
    final snapshot=await firebaseFirestore.collection(collectionUser)
        .get();
    final userData=snapshot.docs.map((e) => UserDetails.fromSnapshot(e)).toList();
    return userData;
  }

}