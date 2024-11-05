import 'package:flutter/material.dart';
import 'package:quick_task/common/my_button.dart';
import 'package:quick_task/common/my_textfield.dart';
import 'package:quick_task/pages/Home.dart';
import 'package:quick_task/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
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
                  onTap: _handleLogin,
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
