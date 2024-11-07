import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quick_task/common/my_button.dart';
import 'package:quick_task/common/my_snackbar.dart';
import 'package:quick_task/common/my_textfield.dart';
import 'package:quick_task/pages/Home.dart';
import 'package:quick_task/pages/register.dart';
import 'package:http/http.dart' as http;
import 'package:quick_task/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthServices authServices = AuthServices();

  final String baseURL = 'http://10.0.2.2:8000/api';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future _loginUser() async {
    final String URL = '$baseURL/token/';

    final loginCredentials = {
      'username': _emailController.text,
      'password': _passwordController.text
    };
    try {
      final response = await http.post(
        Uri.parse(URL),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(loginCredentials),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        await authServices.saveTokens(
            responseData['refresh'], responseData['access']);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
        final snackBar = MySnackbar(
            message: "Successfully Login User.", messageType: "success");
        ScaffoldMessenger.of(context).showSnackBar(snackBar.showSnackBar());
      } else if (response.statusCode == 401) {
        final snackBar = MySnackbar(
            message: "Login failed. Please check your credentials .",
            messageType: "error");
        ScaffoldMessenger.of(context).showSnackBar(snackBar.showSnackBar());
      } else if (response.statusCode == 400) {
        final snackBar = MySnackbar(
            message: "An error occurred. Please try again later.",
            messageType: "error");
        ScaffoldMessenger.of(context).showSnackBar(snackBar.showSnackBar());
      }
    } catch (e) {
      final snackBar = MySnackbar(
          message: "An error occurred. Please try again later.",
          messageType: "error");
      ScaffoldMessenger.of(context).showSnackBar(snackBar.showSnackBar());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    child: Image.asset('assets/images/todo_splash.png',
                        height: 75, width: 75)),
                Text(
                  "QuickTask",
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "W E L C O M E",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextfield(
                  textFieldController: _emailController,
                  isObsecureText: false,
                  labelText: "Email",
                  prefixIcon: Icon(
                    Icons.email,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                MyTextfield(
                  textFieldController: _passwordController,
                  isObsecureText: true,
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password? ",
                      style: TextStyle(color: Colors.blue.shade400),
                    )),
                SizedBox(
                  height: 20,
                ),
                MyButton(
                  size: size,
                  text: "L O G I N",
                  onTap: _loginUser,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a new Account ?",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
