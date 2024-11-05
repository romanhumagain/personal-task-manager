import 'package:flutter/material.dart';
import 'package:quick_task/pages/login.dart';

import '../common/my_button.dart';
import '../common/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _coPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleRegister() {}

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height,
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
                    "R E G I S T E R ",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  MyTextfield(
                    textFieldController: _usernameController,
                    isObsecureText: false,
                    labelText: "Username",
                    prefixIcon: Icon(
                      Icons.person,
                      size: 20,
                    ),
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
                    height: 20,
                  ),
                  MyTextfield(
                    textFieldController: _passwordController,
                    isObsecureText: true,
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyTextfield(
                    textFieldController: _coPasswordController,
                    isObsecureText: true,
                    labelText: "Confirm Password",
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      size: 20,
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    size: size,
                    text: "S I G N   U P",
                    onTap: _handleRegister,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an Account ?",
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
                                  builder: (context) => LoginPage()));
                        },
                        child: Text(
                          "Sign In",
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
      ),
    );
  }
}
