import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AppBarComponent(GlobalKey<ScaffoldState> key)
{
  return Container(
    height: 80,
    color: CupertinoColors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: ()
          {
            key.currentState!.openDrawer();
          },
          child: Container(
            decoration: BoxDecoration(
              color: CupertinoColors.black,
              borderRadius: BorderRadius.only(topRight: Radius.circular(100),
              bottomRight: Radius.circular(100))
            ),
            width: 80,
            height: 50,
            child: Icon(
              Icons.settings,
              color: CupertinoColors.white,
            ),
          ),
        ),
        Text("AppChat",style: TextStyle(
          fontSize: 20
        ),),
        Container(
          child: CircleAvatar(
              radius: 25,
            backgroundColor: CupertinoColors.black,
          ),
        )
      ],
    ),
  );
}