import 'package:e_commernce_ui/Screens/Homepage.dart';
import 'package:e_commernce_ui/Screens/Signup.dart';
import 'package:page_transition/page_transition.dart';
import 'package:e_commernce_ui/widgetsui.dart';
import 'package:flutter/material.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../Data/Sharedprefs.dart';
import '../Data/api.dart';
import '../Data/model.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

final _formKey = GlobalKey<FormState>();



final TextEditingController emailController = new TextEditingController();
final TextEditingController passwordController = new TextEditingController();

String? errorMessage;




class _loginState extends State<login> {

  final emailField =
  TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
            .hasMatch(value)) {
          return ("Please Enter a valid email");
        }
        return null;
      },
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),

      )

  );


  final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Password is required for login");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Password(Min. 6 Character)");
        }
      },
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      )
  );


  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/giphy1.gif"),
            fit: BoxFit.cover),),
        child: Center(

          child: SingleChildScrollView(



              child: Container(
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  color: Colors.white54,

                ),
                margin:const EdgeInsets.all(14.0) ,
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                //      const CircleAvatar(
                  //      backgroundImage : AssetImage
                    //      ("assets/images/select.png"),
                      //  minRadius: 100,
                        //maxRadius: 100,

                      //),




                      SizedBox(height: 45),

                      emailField,


                      SizedBox(height: 25),
                      passwordField,
                      SizedBox(height: 35),


                      newButton(width:  MediaQuery.of(context).size.width * 0.35,
                          title: Text("Log in" ,style: TextStyle(color: Colors.white),),
                          function: (){

                        if (_formKey.currentState!.validate())
                          {
                            CacheHelper.saveData(key: "loginstate" ,
                                value: true);
                            CacheHelper.saveData(key: "emailstate" ,
                                value: emailController.text);

                            Navigator.pushReplacement(
                              context, PageTransition(
                              child: homepage(),
                              type: PageTransitionType.rightToLeft,
                            ),
                            );
                          }


                          },
                        color: Colors.indigo.shade400,
                      ),


                      SizedBox(height: 20,),
                      Text("Or Sign in using Facebook" , style: TextStyle(color: Colors.black54),),
                      SizedBox(height: 20,),

                      newButton(width:  MediaQuery.of(context).size.width * 0.25,
                        title:  Icon(Icons.facebook , color: Colors.white,),
                        function:
                            () {
                          Navigator.push(
                              context, PageTransition(
                            child: homepage(),
                            type: PageTransitionType.leftToRightWithFade,
                          ),
                          );
                        },


                        color: Colors.blueAccent.shade400,
                      ),

                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account? ",style: TextStyle(
                                color: Colors.black87,

                                fontSize: 15),),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context, PageTransition(
                                  child: Signupscreen(),
                                  type: PageTransitionType.leftToRightWithFade,
                                ),
                                );


                              },
                              child: Text(
                                "SignUp",
                                style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            )
                          ])
                    ],
                  ),
                ),
              ),

          ),
        ),
      ),
    );
  }

}

