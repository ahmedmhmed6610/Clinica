import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinica/controllers/product_controller.dart';
import 'package:clinica/tools/drawer.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';
import 'package:clinica/add_patient.dart';

class View_Patient extends StatelessWidget {
  ProductController _productController = Get.put(ProductController());
  AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(title: Text(lang.text('app_name')),
          // actions: [IconButton(onPressed: () {
          //   //     Get.to(()=>HomeWork_Notification());
          // }, icon: Icon(Icons.notifications_none))
          // ],
          centerTitle: true,),
   //     drawer: NavDrawer(),
        body: Container(
          height: size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/addtask1.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Obx(() =>
              _productController.list_Patient.isEmpty ? Center(
                child: Center(child: CircularProgressIndicator()),
              ) : ListView.builder(
                  itemCount: _productController.list_Patient.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                  itemBuilder: (context, index) =>
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          //     side: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset('assets/image/patient.png',width: 50,),
                                SizedBox(width: size.width*0.035,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(_productController.list_Patient[index].name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                    Text(_productController.list_Patient[index].mobile,style: TextStyle(fontSize: 16),),
                                  ],
                                ),
                                Text(_productController.list_Patient[index].gender,style: TextStyle(fontSize: 16),),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(onPressed: (){
                                      _productController.list_Patient.removeWhere((element) => element.name== _productController.list_Patient[index].name);
                                    }, icon: Icon(Icons.delete_forever)),
                                    IconButton(onPressed: (){
                                      Get.to(()=>Add_patient(user: _productController.list_Patient[index],));
                                    }, icon: Icon(Icons.edit)),
                                  ],
                                )
                              ],
                            ),

                          ],
                        ),
                      ))),
            ],
          )
        ));
  }
}