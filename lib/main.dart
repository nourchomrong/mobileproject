import 'package:flutter/material.dart';
import 'package:project/authpage/login_screen.dart';
import 'package:project/authpage/register_screen.dart';
import 'package:project/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project/data/shared_pref_manager.dart';
import 'startup_screen.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  // await SharedPrefManager.instance.savePref();
  // await SharedPrefManager.instance.getPref();
  runApp(MyApp());
}







class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      routes: {
        '/': (context) => StartupScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
      },

      initialRoute: '/',
      // home: LoginScreen(),
    );
  }
}