import 'dart:math';

import 'package:appchat/consts/firebase_consts.dart';
import 'package:appchat/detail/user.dart';
import 'package:appchat/screens/chat_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget UserChatComponent()
{
  List<UserDetails>? listUser=[];
  return Container(
    child: StreamBuilder(
        stream: firebaseFirestore.collection(collectionUser)
        .snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            final data=snapshot.data!.docs;
            return ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  listUser.add(UserDetails.fromSnapshot(snapshot.data!.docs[index]));
                  return ListTile(
                    onTap: () {
                      Get.to(
                              () => ChatScreen(),
                          transition: Transition.downToUp
                      );
                    },
                    leading: CircleAvatar(
                      backgroundColor: CupertinoColors.black,
                      radius: 25,
                      child: CachedNetworkImage(
                        imageUrl: listUser[index].img_url,
                      ),
                    ),
                    title: Text(listUser[index].hoTen),
                  );
                }
            );
          }
        else return Container();
      }
    )
  );
}

