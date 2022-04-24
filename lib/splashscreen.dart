import 'dart:async';
import 'package:clinica/Login.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:clinica/Home.dart';
import 'package:clinica/controllers/product_controller.dart';


class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Timer(Duration(seconds: 7), () => Get.offAll(()=>ProductController().get_Login_name()=='' ?Login():Home()),);
//    Timer(Duration(seconds: 7), () => Get.offAll(()=>ProductController().get_full_name()=='' ?Login(): MapLocation()),);


    var image = new Image(
        image: AssetImage(
            'assets/logo.png'), height:size.height*0.25); //<- Creates a widget that displays an image.

    return Scaffold(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        body: Container(
          padding: EdgeInsets.only(top: 35),
          decoration: new BoxDecoration( image: DecorationImage(
            image: AssetImage("assets/image/welcome.jpg"),
            fit: BoxFit.cover,
          ),),
          child: Center(
            child: Stack(

                children: [

                  Column(
                    children: [
                    image,
                      SizedBox(
                        height: 35,
                      ),
                      Text(AppLocalizationsLanguages.instance.text('app_name'),style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 30),),
                  //    Lottie.asset('assets/lottie/barcode-scanner.json',width: size.width *0.90),
                      Lottie.asset('assets/lottie/pediatrics.json',width: size.width *0.90),

                    ],
                  ),
                  // Load a Lottie file from your assets


                    Positioned(
                         bottom: 45,
                         left: 0,
                         right: 0,
                         child: Center(
                           child: CircularProgressIndicator(),
                         )
                     )
                ],
              ),
          )
        ), //<- place where the image appears

    );
  }
}