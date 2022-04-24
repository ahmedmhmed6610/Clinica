import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clinica/controllers/product_controller.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';
import 'package:clinica/tools/drawer.dart';
import 'package:clinica/add_patient.dart';
import 'package:clinica/view_Patient.dart';

class Home extends StatelessWidget{
  ProductController _productController = Get.put(ProductController());
  AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
   return Scaffold(
     appBar:AppBar(title: Text(lang.text('app_name')),
     actions:[IconButton(onPressed: (){
  //     Get.to(()=>HomeWork_Notification());
     }, icon: Icon(Icons.notifications_none))],
     centerTitle: true,),
     drawer: NavDrawer(),
     body:  Container(
         // decoration: BoxDecoration(
         //     image: DecorationImage(
         //         image: AssetImage("assets/images/login_bk.png"),
         //         fit: BoxFit.cover
         //     )
         // ),
         child: Center(
           child: Column(
       //     mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               SizedBox(height: size.height*0.035,),
             //  Text("LOGO",style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.w900,fontSize: 30),),
               Image(
                   image: AssetImage(
                       'assets/logo.png'), height:size.height*0.085),
               // IconButton(onPressed: (){Get.to(MapLocation());}, icon: Image.asset('assets/icons/map1.png',)),
               SizedBox(height: size.height*0.035,),
               ahmed(size,context),


             ],
           ),
         ),
       ),

   );
  }


  ahmed(size,context){
    return  Expanded(
      child: GridView.count(
        primary: false,
        physics: ScrollPhysics(),
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        crossAxisCount: 2,
        childAspectRatio:  1.4,
        children: <Widget>[


          Container(
        //     padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                elevation: 5,
                color: Colors.orange[50],
                child: InkWell(
                  onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Page6()));
                 //   Get.to(()=>Father());
                  },
                  splashColor: Colors.cyanAccent,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                  //      Icon(Icons.supervisor_account_outlined,size:size.height*0.065 ,color: Colors.deepOrangeAccent,),
                    Flexible(
                    fit: FlexFit.tight,
                      child:  Image.asset('assets/image/patient.png',height: size.height*0.080,),
                    ),

                        SizedBox(height: size.height*0.010,),
                        Text(lang.text('Patients'),style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.020
                        ),),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(onPressed: (){
                            Get.to(()=>Add_patient(user:null,));
                          }, icon: Icon(Icons.person_add)),
                          IconButton(onPressed: (){
                              Get.to(()=>View_Patient());
                          }, icon: Icon(Icons.list_alt)),
                        ],
                      )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            //     padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                elevation: 5,
                color: Colors.cyanAccent[100],
                child: InkWell(
                  onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Page6()));
                    //   Get.to(()=>Father());
                  },
                  splashColor: Colors.cyanAccent,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          fit: FlexFit.tight,
                          child:  Image.asset('assets/image/patient.png',height: size.height*0.080,),
                        ),
                        SizedBox(height: size.height*0.010,),
                        Text(lang.text('Rendez-vous'),style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.020
                        ),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Get.to(()=>Add_patient(user:null,));
                            }, icon: Icon(Icons.person_add)),
                            IconButton(onPressed: (){
                              Get.to(()=>View_Patient());
                            }, icon: Icon(Icons.list_alt)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            //     padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                elevation: 5,
                color: Colors.greenAccent[100],
                child: InkWell(
                  onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Page6()));
                    //   Get.to(()=>Father());
                  },
                  splashColor: Colors.green,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //      Icon(Icons.supervisor_account_outlined,size:size.height*0.065 ,color: Colors.deepOrangeAccent,),
                        Flexible(
                          fit: FlexFit.tight,
                          child:  Image.asset('assets/image/patient.png',height: size.height*0.080,),
                        ),
                        SizedBox(height: size.height*0.010,),
                        Text(lang.text('Consultations'),style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.020
                        ),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Get.to(()=>Add_patient(user:null,));
                            }, icon: Icon(Icons.person_add)),
                            IconButton(onPressed: (){
                              Get.to(()=>View_Patient());
                            }, icon: Icon(Icons.list_alt)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            //     padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                elevation: 5,
                color: Colors.blueAccent[100],
                child: InkWell(
                  onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Page6()));
                    //   Get.to(()=>Father());
                  },
                  splashColor: Colors.blue,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //      Icon(Icons.supervisor_account_outlined,size:size.height*0.065 ,color: Colors.deepOrangeAccent,),
                        Flexible(
                          fit: FlexFit.tight,
                          child:  Image.asset('assets/image/patient.png',height: size.height*0.080,),
                        ),
                        SizedBox(height: size.height*0.010,),
                        Text(lang.text('Docteurs'),style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.020
                        ),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Get.to(()=>Add_patient(user:null,));
                            }, icon: Icon(Icons.person_add)),
                            IconButton(onPressed: (){
                              Get.to(()=>View_Patient());
                            }, icon: Icon(Icons.list_alt)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            //     padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                elevation: 5,
                color: Colors.deepOrangeAccent[100],
                child: InkWell(
                  onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Page6()));
                    //   Get.to(()=>Father());
                  },
                  splashColor: Colors.deepOrangeAccent,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //      Icon(Icons.supervisor_account_outlined,size:size.height*0.065 ,color: Colors.deepOrangeAccent,),
                        Flexible(
                          fit: FlexFit.tight,
                          child:  Image.asset('assets/image/patient.png',height: size.height*0.080,),
                        ),
                        SizedBox(height: size.height*0.010,),
                        Text(lang.text('Utilisateurs'),style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.020
                        ),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Get.to(()=>Add_patient(user:null,));
                            }, icon: Icon(Icons.person_add)),
                            IconButton(onPressed: (){
                              Get.to(()=>View_Patient());
                            }, icon: Icon(Icons.list_alt)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            //     padding: const EdgeInsets.all(8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                elevation: 5,
                color: Colors.lime[100],
                child: InkWell(
                  onTap: () {
                    //         Navigator.push(context, MaterialPageRoute(builder: (context) => Page6()));
                    //   Get.to(()=>Father());
                  },
                  splashColor: Colors.cyanAccent,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //      Icon(Icons.supervisor_account_outlined,size:size.height*0.065 ,color: Colors.deepOrangeAccent,),
                        Flexible(
                          fit: FlexFit.tight,
                          child:  Image.asset('assets/image/patient.png',height: size.height*0.080,),
                        ),
                        SizedBox(height: size.height*0.010,),
                        Text(lang.text('Medicaments'),style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.020
                        ),),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              Get.to(()=>Add_patient(user:null,));
                            }, icon: Icon(Icons.person_add)),
                            IconButton(onPressed: (){
                              Get.to(()=>View_Patient());
                            }, icon: Icon(Icons.list_alt)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }



}