import 'package:e_commernce_ui/Screens/Homepage.dart';
import 'package:e_commernce_ui/Screens/reallogin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../widgetsui.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({Key? key}) : super(key: key);

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

  final _formKe = GlobalKey<FormState>();


final TextEditingController fname = new TextEditingController();
final TextEditingController lname = new TextEditingController();

  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  String? errorMessage;




class _SignupscreenState extends State<Signupscreen> {

  final firstname =
  TextFormField(
      autofocus: false,
      controller: fname,
      keyboardType: TextInputType.name,

      onSaved: (value) {
        fname.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "first name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),

      )

  );

  final lastname =
  TextFormField(
      autofocus: false,
      controller: lname,
      keyboardType: TextInputType.name,

      onSaved: (value) {
        lname.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "last name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),

      )

  );
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
  final passwordField =
  TextFormField(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/lol.jpg"),
              fit: BoxFit.cover,
          ),

        ),
        child: Center(

          child: SingleChildScrollView(
            child:Container(
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white54,

              ),
              margin:const EdgeInsets.all(14.0) ,
              padding: const EdgeInsets.all(25.0),
                child: Form(
                  key: _formKe,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                        Image(image: AssetImage
                          ("assets/images/signup.png"),width: 220,height: 220,),





                      SizedBox(height: 45),

                      firstname,
                      SizedBox(height: 20),
                      lastname,

                      SizedBox(height: 20),

                      emailField,


                      SizedBox(height: 20),
                      passwordField,
                      SizedBox(height: 20),
                      newButton(width:  MediaQuery.of(context).size.width * 0.35,
                        title: Text("Sign up" ,style: TextStyle(color: Colors.white),),
                        function: (){
                          Navigator.pop(
                              context, PageTransition(
                            child: login(),
                            type: PageTransitionType.rightToLeftJoined,
                          ),
                          );
                        },
                        color: Colors.indigo.shade400,
                      ),


                      SizedBox(height: 20,),
                        Text("Or Sign in using Facebook" , style: TextStyle(color: Colors.black45),),
                      SizedBox(height: 20,),

                      newButton(width:  MediaQuery.of(context).size.width * 0.25,
                        title:  Icon(Icons.facebook , color: Colors.white,),
                        function:
                              () {
                            Navigator.pushReplacement(
                                context,PageTransition(
                              child: homepage(),
                              type: PageTransitionType.rightToLeft,
                            ),
                            );
                          },


                        color: Colors.blueAccent.shade400,
                      ),
                      SizedBox(height: 55,),


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