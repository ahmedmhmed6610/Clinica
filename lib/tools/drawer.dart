import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clinica/Login.dart';
import 'package:get/get.dart';
import 'package:clinica/Home.dart';
import 'package:clinica/controllers/product_controller.dart';
import 'package:clinica/data/savedataapp.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';

import 'kstyle.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;
  ProductController _productController = Get.put(ProductController());
  final save = SaveDataApp();
  bool ahmed = false;

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: Column(
      children: [
        new Expanded(
          child: ListView(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text(
                  _productController.Login_name.value,
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: new Text(
                  lang.text('app_name'),
                  style: TextStyle(color: Colors.black),
                ),
                decoration: new BoxDecoration(
                  image: new DecorationImage(
                    image: new ExactAssetImage('assets/image/header1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
           //      currentAccountPicture: CircleAvatar(
           //        radius: 60.0,
           //        backgroundColor:  Colors.white,
           // //       child: Image.network("http://preview-candles.com/User_Image/${_productController.image.value}",height: 50,),
           //        child: Image.asset("assets/logo.png",height: 50,),
           //      ),
              ),
              new SizedBox(
                height: 30,
              ),
              new ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                  ),
                  title:
                      new Text(AppLocalizationsLanguages.instance.text("Home")),
                  onTap: () {
                    Navigator.pop(context);
                    //       Get.offAll(MyHome());
                  }),
              // new ListTile(
              //     leading: Icon(
              //       Icons.school_outlined,
              //     ),
              //     title:
              //         new Text(AppLocalizationsLanguages.instance.text("Achievement file")),
              //     onTap: () {
              //       Navigator.pop(context);
              //       //       Get.offAll(MyHome());
              //     }),
              // new ExpansionTile(
              //   leading: Icon(Icons.star_half, color: KiconColor),
              //   title: Text(lang.text("Certificates")),
              //   children: <Widget>[
              //     ///////////////////
              //     new ListTile(
              //         leading: Icon(Icons.star_half,),
              //         title: new Text(
              //             AppLocalizationsLanguages.instance.text("Certificates of Appreciation")),
              //         onTap: () {
              //           Navigator.pop(context);
              //           //       Get.to(Page1());
              //         }),
              //     new ListTile(
              //         leading: Icon(Icons.mail_outline,),
              //         title: new Text(
              //             AppLocalizationsLanguages.instance.text("letters")),
              //         onTap: () {
              //           Navigator.pop(context);
              //           //       Get.to(Page1());
              //         }),
              //
              //
              //     //////////////////
              //   ],
              // ),
              // new ExpansionTile(
              //   leading: Icon(Icons.book_outlined, color: KiconColor),
              //   title: Text(lang.text("Library of books and lessons")),
              //   children: <Widget>[
              //     ///////////////////
              //     new ListTile(
              //         leading: Icon(Icons.book_outlined,),
              //         title: new Text(
              //             AppLocalizationsLanguages.instance.text("Books and curricula")),
              //         onTap: () {
              //           Navigator.pop(context);
              //           //       Get.to(Page1());
              //         }),
              //     new ListTile(
              //         leading: Icon(Icons.contact_page_outlined,),
              //         title: new Text(
              //             AppLocalizationsLanguages.instance.text("Lessons library")),
              //         onTap: () {
              //           Navigator.pop(context);
              //           //       Get.to(Page1());
              //         }),
              //
              //
              //     //////////////////
              //   ],
              // ),
              // new ExpansionTile(
              //   leading: Icon(Icons.credit_card, color: KiconColor),
              //   title: Text(lang.text("financial records")),
              //   children: <Widget>[
              //     ///////////////////
              //     new ListTile(
              //         leading: Icon(Icons.account_balance_wallet_outlined,),
              //         title: new Text(
              //             AppLocalizationsLanguages.instance.text("Account statements")),
              //         onTap: () {
              //           Navigator.pop(context);
              //           //       Get.to(Page1());
              //         }),
              //     new ListTile(
              //         leading: Icon(Icons.credit_card,),
              //         title: new Text(
              //             AppLocalizationsLanguages.instance.text("electronic payment")),
              //         onTap: () {
              //           Navigator.pop(context);
              //           //       Get.to(Page1());
              //         }),
              //
              //
              //     //////////////////
              //   ],
              // ),
              // new ListTile(
              //     leading: Icon(
              //       Icons.alarm,
              //     ),
              //     title:
              //     new Text(AppLocalizationsLanguages.instance.text("ALarm")),
              //     onTap: () {
              //    //   Navigator.pop(context);
              //      //       Get.offAll(()=>ALarm());
              //     }),


              new Divider(),
              new ListTile(
                  leading: Icon(
                    Icons.language,
                  ),
                  title: new Text(
                    lang.text("Language"),
                  ),
                  onTap: () {
                    _showDialoglanguage(context);
                  }),
              new ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                  ),
                  title: new Text(
                    lang.text("Logout"),
                  ),
                  onTap: () {
                    save.delete();
                    Get.offAll(()=>Login());
                    //   SystemNavigator.pop();
                  }),
              new Divider(),
              new SwitchListTile(
                value: SaveDataApp().get_saveThemeMode(),
                title: new Text(
                  lang.text("Dark theme"),
                ),
                onChanged: (value) {
                  setState(() {
                    var ah = _productController.chageThemeMode();
                    ah = value;
                  });
                },
              ),
            ],
          ),
        ),

        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: ListTile(
        //       leading: Icon(Icons.refresh),
        //       title: Text(lang.text("refresh")),
        //   onTap: (){
        //     Get.snackbar(lang.text("ok"), lang.text("refresh"),backgroundColor: Colors.amberAccent);
        //     Navigator.pop(context);
        //     Get.offAll(Wait_Page());
        //   },),
        // ) , Align(
        //   alignment: Alignment.bottomCenter,
        //   child: ListTile(
        //       leading: Icon(Icons.settings),
        //       title: Text(lang.text("Settings")),
        //   onTap: (){
        //
        //         Get.to(Page_ip());
        //   },),
        // )
      ],
    ));
  }

  _showDialoglanguage(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          var _isRadioSelected;
          return AlertDialog(
              title: Text(lang.text("Select Language")),
              content: StatefulBuilder(
                builder: (context, setState) {
                  return Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        RadioListTile(
                          title: Text(lang.text("language English")),
                          secondary: Icon(Icons.sd_storage),
                          value: "en",
                          groupValue: _isRadioSelected,
                          selected: ProductController().getlanguage() == "en"
                              ? true
                              : false,
                          onChanged: (value) {
                            setState(() {
                              _isRadioSelected = value;
                              Get.updateLocale(Locale('en', 'US'));
                              save.set_savelanguage(_isRadioSelected);
                              print(_isRadioSelected);
                              Timer(Duration(seconds: 1),
                                  () => Get.offAll(Home()));
                            });
                          },
                        ),
                        RadioListTile(
                          title: Text(lang.text("language arabic")),
                          secondary: Icon(Icons.sd_storage),
                          value: "ar",
                          groupValue: _isRadioSelected,
                          selected: ProductController().getlanguage() == "ar"
                              ? true
                              : false,
                          onChanged: (value) {
                            setState(() {
                              _isRadioSelected = value;
                              print(_isRadioSelected);
                              Get.updateLocale(Locale('ar', 'EG'));
                              save.set_savelanguage(_isRadioSelected);
                              Timer(Duration(seconds: 1),
                                  () => Get.offAll(Home()));
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ));
        },
      );
}

ahmed(context) {
  AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;
  return new ExpansionTile(
    leading: Icon(Icons.view_headline_rounded, color: KiconColor),
    title: Text(lang.text("All Category")),
    children: <Widget>[
      ///////////////////
      ListTile(
          title: new Text(
            lang.text("Mobile"),
            style: TextStyle(color: kTextColor),
          ),
          onTap: () {
            //       Get.to(()=>HomePage_categories(number: "productListcategory_Mobile",));
          }),

      //////////////////
    ],
  );
}
