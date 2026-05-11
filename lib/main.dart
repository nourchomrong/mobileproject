import 'package:flutter/material.dart';
import 'package:project/authpage/login_screen.dart';
import 'package:project/authpage/register_screen.dart';
import 'package:project/home.dart';
import 'startup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      // ✅ routes must be here
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