import 'package:flutter/material.dart';
import 'package:project/widgets/app_logo.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  String emailValue = "";
  bool isEmailValid = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }


  bool checkEmail(String value) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value);
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "សូមបញ្ចូលអ៊ីមែល";
    }

    if (!checkEmail(value)) {
      return "អ៊ីមែលមិនត្រឹមត្រូវ";
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "សូមបញ្ចូល password";
    }

    if (value.length < 6) {
      return "Password ត្រូវមានយ៉ាងតិច 6 តួ";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    final username = TextFormField(
      validator: validateEmail,

      onChanged: (value) {
        setState(() {
          emailValue = value;
          isEmailValid = checkEmail(value);
        });
      },

      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.email_outlined),

        suffixIcon: Icon(
          emailValue.isEmpty
              ? Icons.circle_outlined : (isEmailValid ? Icons.check_circle : Icons.cancel),
          color: emailValue.isEmpty
              ? Colors.grey : (isEmailValid ? Colors.green : Colors.red),
        ),
      ),
    );

    final password = TextFormField(
      obscureText: !isPasswordVisible,
      validator: validatePassword,

      decoration: InputDecoration(
        hintText: 'Password',
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.lock_outline),

        suffixIcon: IconButton(
          onPressed: togglePasswordVisibility,
          icon: Icon(
            isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
          ),
        ),
      ),
    );

    final loginButton = SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF0997A4),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: Text(
          "ចូលប្រើប្រាស់",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    final forgotPassword = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text("ភ្លេចលេខសម្ងាត់"),
        ),
      ],
    );

    final createAccount = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("មិនមានគណនីទេ?"),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Text("ចុះឈ្មោះ"),
        ),
      ],
    );

    final socialWidget = Row(
      children: [
        Expanded(child: Divider()),
        Text("  ឬក៏  "),
        Expanded(child: Divider()),
      ],
    );

    final facebookAndGoogle = Row(
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
      ],
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
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
                createAccount,
                SizedBox(height: 20),
                socialWidget,
                SizedBox(height: 20),
                facebookAndGoogle,
              ],
            ),
          ),
        ),
      ),
    );
  }
}