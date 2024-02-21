import 'package:appchat/consts/firebase_consts.dart';

class StoreServices{
  static getUser(String id)
  {
    return firebaseFirestore
        .collection(collectionUser)
        .where('id',isEqualTo: id).get();
  }
}