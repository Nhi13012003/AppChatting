import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

Widget ImagePickerDialog(context,controller){
  var listTitle=["máy ảnh","thư viện","hủy"];
  var icons=[Icons.camera_alt_rounded,Icons.photo_size_select_actual_outlined,Icons.cancel_outlined];
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16)
    ),
    child: Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
              shrinkWrap:true,itemCount:3,itemBuilder: (
          BuildContext context,int index)
          {
            return ListTile(
              onTap: (){
                switch(index)
                    {
                  case 0:
                    Get.back();
                    controller.selectImage(context,ImageSource.camera);
                    break;

                  case 1:
                    Get.back();
                    controller.selectImage(context,ImageSource.gallery);
                    break;
                  case 2:
                    Get.back();
                    break;
                    }
              },
              leading: Icon(icons[index]),
              title: Text(listTitle[index]),
            );
          }
          )
        ],
      ),
    ),
  );
}