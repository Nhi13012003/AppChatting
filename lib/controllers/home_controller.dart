import 'package:appchat/consts/firebase_consts.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController{
  late SharedPreferences sharedPreferences;
  getUsersDetail( ) async{
    await firebaseFirestore
        .collection(collectionUser)
        .where('id',isEqualTo: currentUser!.uid)
        .get()
        .then((value) async{
          sharedPreferences=await SharedPreferences.getInstance();
          sharedPreferences.setStringList('user_details',[
            value.docs[0]['Hoten'],
            value.docs[0]['image_url']
          ]);
    });
  }
  @override
  void onInit() {
    getUsersDetail();
    super.onInit();
  }
}