import 'package:flutter/material.dart';

class MySnackbar {
  final String message;
  final String messageType;

  const MySnackbar({required this.message, required this.messageType});

  SnackBar showSnackBar() {
    return SnackBar(
      content: Row(
        children: [
          messageType == 'success'
              ? Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 30,
                )
              : Icon(
                  Icons.error,
                  color: Colors.white,
                  size: 30,
                ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      backgroundColor: messageType == 'success' ? Colors.green : Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(16),
      elevation: 10,
      duration: Duration(seconds: 2),
    );
  }
}
