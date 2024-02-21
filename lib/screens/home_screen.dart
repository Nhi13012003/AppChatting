import 'package:appchat/components/drawer.dart';
import 'package:appchat/components/tabbarview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/appbar.dart';
import '../components/tabbar.dart';
import '../controllers/home_controller.dart';
class HomeScreen extends  StatefulWidget {  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}
class HomeScreenState extends State<HomeScreen> {  @override
  Widget build(BuildContext context) {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final controller=Get.put(HomeController());
  return Scaffold(
      key: scaffoldKey,
      drawer: DrawerComponent(),
      body: DefaultTabController(
        length: 3,
        child: Container(
          margin: EdgeInsets.only(right: 16),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              AppBarComponent(scaffoldKey),
              Expanded(
                child: Row(
                  children: [
                    TabBarComponent(),
                    TabBarViewComponent(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
