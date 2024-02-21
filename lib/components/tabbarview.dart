import 'package:appchat/components/userchat.dart';
import 'package:appchat/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TabBarViewComponent()
{
  return Expanded(
    child: TabBarView(
    children: [
      Container(
        child: UserChatComponent(),
      ),
      Container(
        child: Text("mang xa hoi"),
      ),
      ProfileScreen(),
    ],
    ),
  );
}
