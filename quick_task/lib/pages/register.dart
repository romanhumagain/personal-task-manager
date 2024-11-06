import 'package:flutter/material.dart';
import 'package:quick_task/common/my_snackbar.dart';
import 'package:quick_task/models/user_model.dart';
import 'package:quick_task/pages/Home.dart';
import 'package:quick_task/pages/login.dart';
import 'package:quick_task/services/user_services.dart';

import '../common/my_button.dart';
import '../common/my_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _coPasswordController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // function to validate username
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your username";
    }
    return null;
  }

  // function to validate email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
        .hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // Function to validate password (should be at least 6 characters)
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Function to check if passwords match
  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != _passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserServices userServices = UserServices();
        final userData = {
          'username': _usernameController.text,
          'email': _emailController.text,
          'password': _passwordController.text
        };
        UserModel userModel = await userServices.registerUser(userData);
        _clearRegistrationForm();

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
        final snackBar = MySnackbar(
          message: "Successfully Registered Your Account",
          messageType: 'success',
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar.showSnackBar());
      } catch (e) {
        final snackBar = MySnackbar(
          message: "Something went wrong! Please try again later.",
          messageType: 'error',
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar.showSnackBar());
        print('Registration failed: $e');
      }
    } else {
      // The form is invalid, so the validation error will be shown in the respective fields
    }
  }

  void _clearRegistrationForm() async {
    _emailController.clear();
    _passwordController.clear();
    _usernameController.clear();
    _coPasswordController.clear();
  }

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
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextfield(
                            textFieldController: _usernameController,
                            isObsecureText: false,
                            labelText: "Username",
                            validator: _validateUsername,
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
                            validator: _validateEmail,
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
                            validator: _validatePassword,
                            prefixIcon: Icon(Icons.lock),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextfield(
                            textFieldController: _coPasswordController,
                            isObsecureText: true,
                            labelText: "Confirm Password",
                            validator: _validateConfirmPassword,
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
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16),
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
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
