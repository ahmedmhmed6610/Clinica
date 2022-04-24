import 'package:flutter/material.dart';
import 'package:clinica/controllers/product_controller.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';
import 'package:get/get.dart';
import 'package:clinica/models/Patient.dart';
import 'package:clinica/Home.dart';

class Add_patient extends StatefulWidget {
  final Patient?  user;
  const Add_patient({Key? key,required this.user}) : super(key: key);

  @override
  State<Add_patient> createState() => _Add_DataState();
}

class _Add_DataState extends State<Add_patient> {
  final TextEditingController name = TextEditingController();
  final TextEditingController Adresse = TextEditingController();
  final TextEditingController Mobile = TextEditingController();
  final TextEditingController Prenom = TextEditingController();
  final TextEditingController Annee = TextEditingController();
  final TextEditingController Email = TextEditingController();
  String gender = 'Please choose';
  String Etat  = 'Etat Civil*';
  String Assurance  = 'Assurance*';
  AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;
  ProductController _productController = Get.put(ProductController());

  List<String> _list_gender = ['Masculin', 'Feminin',];
  List<String> _list_Assurance = ['le régime général pour les salariés', 'la MSA (Mutualité Sociale Agricole)','la sécurté sociale des indépendants pour les indépendants.'];
  List<String> _list_Etat = ['Célibataire', 'Marié','Divorcé','Veuf','Non marié','Lié par un partenariat enregistré','Partenariat dissous judiciairement','Partenariat dissous par décès','Partenariat dissous ensuite de déclaration d absence',];

  @override
  void initState() {
    if(widget.user != null){
      name.text = widget.user!.name;
      Adresse.text = widget.user!.adresse;
      Mobile.text = widget.user!.mobile;
      Prenom.text = widget.user!.prenom;
      Annee.text = widget.user!.annee;
      Email.text = widget.user!.email;
      gender = widget.user!.gender;
      Etat = widget.user!.etat;
      Assurance = widget.user!.assurance;
    }
    super.initState();
  }
  @override
  void dispose() {
    name.dispose();
    Adresse.dispose();
    Mobile.dispose();
    Prenom.dispose();
    Annee.dispose();
    Email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(lang.text("app_name")),
      ),
      body: SingleChildScrollView(
        child: Container(
          //   color: Colors.greenAccent,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/image/addtask1.jpg"),
                  fit: BoxFit.cover)),
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  SizedBox(height: size.height*0.25,),
                  Text(
                    lang.text('Personal_Information'),
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      autofocus: true,
                      controller: name,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: 'Nom*',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child:  DropdownButton<String>(
                      hint: Text(gender,style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),),
                      isExpanded: true,
                      items: _list_gender.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val){
                        gender = val.toString();
                      } ,
                    ),),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      controller: Mobile,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Mobile*",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child:  DropdownButton<String>(
                      hint: Text(Etat,style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),),
                      isExpanded: true,
                      items: _list_Etat.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val){
                        Etat = val.toString();
                      } ,
                    ),),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      autofocus: true,
                      controller: Adresse,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Adresse*",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      autofocus: true,
                      controller: Prenom,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Prenom*",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      controller: Annee,
                      autofocus: true,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Annee de naissance*",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child: TextField(
                      controller: Email,
                      autofocus: true,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "Email*",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.blue)),
                        isDense: true,
                        // Added this
                        contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                    child:  DropdownButton<String>(
                      hint: Text(Assurance,style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),),
                      isExpanded: true,
                      items: _list_Assurance.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (val){
                        Assurance = val.toString();
                      } ,
                    ),),
                  ElevatedButton(
                      onPressed: () {
                        if(name.text.toString().isEmpty){
                          Get.snackbar(lang.text('error'), lang.text('username'),backgroundColor: Colors.redAccent);
                        }else if(Email.text.toString().isEmpty){
                          Get.snackbar(lang.text('error'), 'Email',backgroundColor: Colors.redAccent);
                        }else if(Mobile.text.toString().isEmpty){
                          Get.snackbar(lang.text('error'), lang.text('Phone number'),backgroundColor: Colors.redAccent);
                        }else if(Annee.text.toString().isEmpty){
                          Get.snackbar(lang.text('error'), lang.text('errorname'),backgroundColor: Colors.redAccent);
                        }else if(Prenom.text.toString().isEmpty){
                          Get.snackbar(lang.text('error'), 'Prenom',backgroundColor: Colors.redAccent);
                        }else if(Adresse.text.toString().isEmpty){
                          Get.snackbar(lang.text('error'), 'Adresse',backgroundColor: Colors.redAccent);
                        }else{


                          var ahmed = Patient(
                              name: name.text.toString().trim(),
                              gender: gender.toString().trim(),
                              etat: Etat.toString().trim(), prenom: Prenom.text.toString().trim(), adresse: Adresse.text.trim().toString(),
                              annee: Annee.text.toString().trim(), mobile: Mobile.text.toString().trim(),
                              email: Email.text.toString().trim(),assurance: Assurance);
                               if(widget.user == null){
                                 _productController.list_Patient.add(ahmed);
                                 Get.snackbar('sauvegarder', 'Données enregistrées avec succès',backgroundColor: Colors.greenAccent);
                               }else{
                              var index = _productController.list_Patient.value.indexWhere((element) => element.name == widget.user!.name);
                              _productController.list_Patient[index] = ahmed ;
                              _productController.list_Patient.refresh();
                              Get.snackbar('sauvegarder', 'Les données ont été modifiées avec succès',backgroundColor: Colors.greenAccent);
                               }
                               }
                          name.clear();
                          Mobile.clear();
                          Annee.clear();
                          Adresse.clear();
                          Prenom.clear();
                          Get.off(()=>Home());

                      },
                      child: Text(lang.text("save"))),
                ],
              ),

        ),
      ),
    );
  }
}
