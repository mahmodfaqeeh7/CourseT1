import 'package:e_commernce_ui/Screens/reallogin.dart';
import 'package:e_commernce_ui/Screens/welcomepage.dart';
import 'package:flutter/material.dart';


import '../Screens/Signup.dart';
import '../Screens/homepage.dart';

const String welcomeRoute='/';
const String loginRoute='/loginRoute';
const String signupRoute='/signupRoute';
const String homeRoute='/homeRoute';


class MyRouter{

  static Route generateRoutes(RouteSettings settings){

    switch (settings.name){
      case welcomeRoute:{
        return _route(WelcomePage());
      }
      case loginRoute:{
        return _route(login());
      }
      case signupRoute:{
        return _route(Signupscreen());
      }
      case homeRoute:{
        return _route(homepage());
      }
      default:{
        return _route(undefined());

      }


    }


  }

  static MaterialPageRoute _route(Widget w){
    return MaterialPageRoute(builder: (_)=>w);
  }
}


class undefined extends StatelessWidget {
  const undefined({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(" undefined page",style: TextStyle(fontSize: 40,color: Colors.red),),
    );
  }
}