import 'dart:ffi';
import 'package:flutter/material.dart';

class MyTextfield extends StatefulWidget {
  final TextEditingController textFieldController;
  final String? hintText;
  final String? labelText;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool isObsecureText;
  final String? Function(String?)? validator;

  MyTextfield(
      {super.key,
      required this.textFieldController,
      required this.isObsecureText,
      this.hintText,
      this.labelText,
      this.prefixIcon,
      this.suffixIcon,
      this.validator});

  @override
  State<MyTextfield> createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isObsecureText;
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: []),
      child: TextFormField(
        controller: widget.textFieldController,
        obscureText: _isObscured,
        validator: widget.validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink),
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          hintText: widget.hintText,
          labelText: widget.labelText,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: Colors.black54,
          suffixIcon: widget.isObsecureText
              ? GestureDetector(
                  onTap: _togglePasswordVisibility,
                  child: Icon(
                    _isObscured ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                )
              : widget.suffixIcon,
        ),
      ),
    );
  }
}
