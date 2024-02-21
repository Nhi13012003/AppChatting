import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget TabBarComponent()
{
  return Container(
 child: RotatedBox(
   quarterTurns: 1,
   child: TabBar(
     labelColor: Colors.white,
     labelStyle: TextStyle(
       fontWeight: FontWeight.w500,
     ),
     indicator: BoxDecoration(),
   tabs: [
    Tab(text: "Tin nhắn",),
    Tab(text: "Mạng xã hội",),
    Tab(text: "Cá nhân",)
   ],
   ),
 ),
);
}