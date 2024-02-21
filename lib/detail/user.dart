
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetails{
 late final String img_url;
  final String? lastActive;
  final bool? isOnline;
  final String? id;
  final String hoTen;
  final String gioiTinh;
  final String ngaySinh;
  final String email;
  UserDetails({
    this.id, required this.img_url,
    required this.hoTen,
    required this.gioiTinh,
    required this.ngaySinh,
    required this.email,
    required this.isOnline,
    required this.lastActive
});
  toJson()
  {
    return {
      "HoTen": hoTen,
      "GioiTinh": gioiTinh,
      "NgaySinh": ngaySinh,
      "Email": email,
      "ImgUrl": img_url,
      "IsOnline": isOnline,
      "LastActive": lastActive,
    };
  }
  factory UserDetails.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> documentSnapshot)
  {
    final data=documentSnapshot.data()!;
    return UserDetails(
      id: documentSnapshot.id,
        hoTen: data["HoTen"]==null?"":data["HoTen"],
        gioiTinh: data["GioiTinh"]==null?"":data["GioiTinh"],
        ngaySinh: data["NgaySinh"]==null?"":data["NgaySinh"],
        img_url: data["ImgUrl"]==null?"":data["ImgUrl"],
        email: data["Email"], isOnline: data["isOnline"], lastActive: data["lastActive"]);
  }
}