import 'package:get_storage/get_storage.dart';
import 'package:clinica/models/Patient.dart';

class SaveDataApp{
  final _getstorage = GetStorage();
  final stotageThemeKey = "isdarkmode";
  final stotagelanguagesKey = "languages";
  final stotage_user_Login_name = "Loginname";
  final stotage_user_Login_pass = "Loginpass";





    set_saveThemeMode(bool isDarkMode){
    _getstorage.write(stotageThemeKey, isDarkMode);
  }
  set_savelanguage(languages){
    _getstorage.write(stotagelanguagesKey, languages);
  }set_save_user_Login_name(id){
    _getstorage.write(stotage_user_Login_name, id);
  }set_save_user_Login_pass(id){
    _getstorage.write(stotage_user_Login_pass, id);
  }

  bool get_saveThemeMode(){
    return _getstorage.read(stotageThemeKey) ?? false ;
  }
  String get_savelanguage(){
    return _getstorage.read(stotagelanguagesKey)== null ?  'en' : _getstorage.read(stotagelanguagesKey);
  }String get_user_Login_name(){
    return _getstorage.read(stotage_user_Login_name)== null ?  '' : _getstorage.read(stotage_user_Login_name);
  }String get_user_Login_pass(){
    return _getstorage.read(stotage_user_Login_pass)== null ?  '' : _getstorage.read(stotage_user_Login_pass);
  }

  delete(){
     _getstorage.remove(stotage_user_Login_name);
     _getstorage.remove(stotage_user_Login_pass);
     _getstorage.remove(stotagelanguagesKey);
  }

}