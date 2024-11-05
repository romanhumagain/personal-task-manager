import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String text;
  final Size size;

  const MyButton({super.key, required this.size, required this.text});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 65.0, vertical: 20),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60),
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: const [Colors.pink, Colors.blue]),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
