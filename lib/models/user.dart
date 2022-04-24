
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));



String userToJson(User data) => json.encode(data.toJson());

class User {

  User({
    required this.id,
    required this.userFullNameAr,
    required this.userName,
    required this.userId,
    required this.password,
    required this.schoolId,
    required this.branchNo,
    required this.imagePath,
    required this.usertype,
  });

  String id;
  String userFullNameAr;
  String userName;
  String userId;
  String password;
  String schoolId;
  String branchNo;
  String imagePath;
  String usertype;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["\u0024id"],
    userFullNameAr: json["User_Full_Name_Ar"],
    userName: json["userName"],
    userId: json["userId"],
    password: json["password"],
    schoolId: json["School_ID"],
    branchNo: json["Branch_No"],
    imagePath: json["image_Path"],
    usertype: json["usertype"],
  );



  Map<String, dynamic> toJson() => {
    "\u0024id": id,
    "User_Full_Name_Ar": userFullNameAr,
    "userName": userName,
    "userId": userId,
    "password": password,
    "School_ID": schoolId,
    "Branch_No": branchNo,
    "image_Path": imagePath,
    "usertype": usertype,
  };

}
