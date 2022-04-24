import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinica/Home.dart';
import 'package:clinica/data/savedataapp.dart';
import 'package:clinica/models/user.dart';
import 'package:clinica/models/Patient.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';


class ProductController extends GetxController {

  static ProductController instance = Get.find();
//   late CollectionReference collectionReference_User ;
 AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;
  final save = SaveDataApp();
  var Login_name = ''.obs;
  var Login_pass = ''.obs;
  var list_Patient = <Patient>[].obs;



  @override
  void onReady(){
    super.onReady();
    get_all_inf();
 //   await Geolocator.openAppSettings();
 //    Geolocator.openLocationSettings();


  }


  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onClose() {
    super.onClose();
  }



  void fetch_Login(name, password){
    save.set_save_user_Login_name(name);
    save.set_save_user_Login_pass(password);
    Get.offAll(()=> Home());

  }





  get_all_inf(){
    get_Login_name();
    get_Login_pass();
  }
  

 get_Login_name(){
    return Login_name(save.get_user_Login_name()) ;
  }get_Login_pass(){
    return Login_pass(save.get_user_Login_pass()) ;
  }getlanguage(){
    return save.get_savelanguage() ;
  }


  ThemeMode getThemeMode(){
    return save.get_saveThemeMode() ? ThemeMode.dark : ThemeMode.light;
  }
  chageThemeMode(){
    Get.changeThemeMode(save.get_saveThemeMode()?ThemeMode.light:ThemeMode.dark);
    save.set_saveThemeMode(!save.get_saveThemeMode());
  }


}
