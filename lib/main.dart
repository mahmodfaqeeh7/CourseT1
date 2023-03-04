import 'package:e_commernce_ui/Screens/reallogin.dart';
import 'package:e_commernce_ui/Screens/welcomepage.dart';
import 'package:flutter/material.dart';
import 'Route.dart';
import 'package:e_commernce_ui/Screens/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commernce_ui/Data/Sharedprefs.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await   CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "FrizQuadrata",
        primarySwatch: Colors.blue,
      ),
      initialRoute:'/',
      onGenerateRoute: MyRouter.generateRoutes,

    );
  }
}
