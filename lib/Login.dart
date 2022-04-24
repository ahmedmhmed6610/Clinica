
import 'package:clinica/controllers/product_controller.dart';
import 'package:clinica/tools/appLocalizations_languages.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController name = TextEditingController();
  TextEditingController pass = TextEditingController();
  AppLocalizationsLanguages lang = AppLocalizationsLanguages.instance;
  bool test_error_name = false ;
  bool test_error_pass = false ;
  bool _passwordVisible = false ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/image/welcome.jpg"),
                        fit: BoxFit.cover
                    )
                ),
            child:    Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8), // Border radius
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.png',
                          height: 75,
                        ),
                      ),
                    ),
                  ),
                   Container(
                     margin: EdgeInsets.only(left: 50,right: 50,bottom: 50,top: 20),
                 //    padding: EdgeInsets.all(50),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topLeft: Radius.circular(40),
                       topRight: Radius.circular(40),
                       bottomLeft: Radius.circular(40),
                       bottomRight: Radius.circular(40),
                     )
                   ),
                    child: Column(
                      children: [
                        // Image.asset('assets/logo.png', height: 75,),

                        SizedBox(height: 10,),
                        Text(lang.text("login"),style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: name,
                            decoration: InputDecoration(
                              hintText: lang.text("username"),
                              errorText: test_error_name ? lang.text("errorname"): null,
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              ),
                              isDense: true,                      // Added this
                              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                prefixIcon: Icon(Icons.person, size: 24),
                            ),
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: pass,
                            decoration: InputDecoration(
                              errorText: test_error_pass ? lang.text("error"):null,
                              hintText: lang.text("password"),
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: Colors.blue
                                  )
                              ),
                              isDense: true,                      // Added this
                              contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.lock, size: 24),
                            ),
                            obscureText: !_passwordVisible,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 10,),

                        //    GestureDetector(onTap: (){
                        // //     Get.to(ForgotPassword());
                        //    },
                        //      child: Text(lang.text("Forgot Password"),style: TextStyle(color: Colors.white),),),

                        SizedBox(height: 10,),
                        ElevatedButton(
                            onPressed: () {

                              setState(() {
                                if(name.text.trim().isNotEmpty){
                                  test_error_name =false;
                                }
                                if(pass.text.trim().isNotEmpty){
                                  test_error_pass =false;
                                }
                                if(name.text.trim().isEmpty){
                                  test_error_name =true;
                                }else if(pass.text.trim().isEmpty){
                                  test_error_pass =true;
                                }else{
                                  ProductController().fetch_Login(name.text.trim(), pass.text.trim());
                                }
                              });


                            },
                            child: Text(lang.text("login"))),
                        SizedBox(height: 50,),

                        // GestureDetector(
                        //   onTap: (){
                        //     //       Navigator.push(context, MaterialPageRoute(builder: (context)=> Registration()));
                        //   },
                        //   child: RichText(text: TextSpan(
                        //     text: lang.text("New User"),
                        //     style: TextStyle(fontSize: 15.0, color: Colors.black),
                        //     children: <TextSpan>[
                        //       TextSpan(
                        //         text: lang.text("Register new Account"),
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.w600,
                        //             fontSize: 18,
                        //             color: Colors.black),
                        //       ),
                        //     ],
                        //   )
                        //   ),
                        // ),
                        // SizedBox(height: 30,)
                      ],
                    ),
                  )
                ],
              ),

              ),


        ),

    );
  }



}
