import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Function onTap;
  final String text;
  final Size size;

  const MyButton(
      {super.key, required this.size, required this.text, required this.onTap});

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
        child: GestureDetector(
          onTap: () {
            widget.onTap();
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: const [Colors.pink, Colors.blue]),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
      ),
    );
  }
}
