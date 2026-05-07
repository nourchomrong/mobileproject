import 'package:flutter/material.dart';
import 'package:project/widgets/app_logo.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey),
        suffixIcon: Icon(Icons.check_circle, color: Colors.grey),
      ),
    );

      final password = TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade200,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          hintText: 'Password',
          prefixIcon: Icon(Icons.lock_outlined, color: Colors.grey),
          suffixIcon: Icon(Icons.visibility, color: Colors.grey),

        ),
        obscureText: true,
    );

      final loginButton =
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF0997A4)),
              onPressed: (){},
              child: Text("ចូលប្រើប្រាស់", style: TextStyle(color: Colors.white)),
            ),
          );

      final forgotPassword = Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: (){}, child: Text("ភ្លេចលេខសង្ងាត់")),
        ],
      );


      final CreateAccount = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("មិនមានគណនីទេ?"),
          TextButton(onPressed: (){}, child: Text("ចុះឈ្មោះ")),
        ],
      );

      final SocailWidget =
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Divider()),
              Text("ឬក៏"),
              Expanded(child: Divider()),
            ],
          );

      final FacebookAndGoogle = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: facebook,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: google,
          )
        ]
      );



    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    logo,
                    SizedBox(height: 30),
                    username,
                    SizedBox(height: 10),
                    password,
                    SizedBox(height: 10),
                    forgotPassword,
                    SizedBox(height: 20),
                    loginButton,
                    SizedBox(height: 10),
                    CreateAccount,
                    SizedBox(height: 20),
                    SocailWidget,
                    SizedBox(height: 20),
                    FacebookAndGoogle,
                  ],

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}