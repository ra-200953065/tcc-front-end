import 'package:flutter/material.dart';

SnackBar snackBarWidget(String message, bool isError) {
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isError == true ? Colors.red.shade400 : Colors.green,
    duration: const Duration(seconds: 2),
  );

  return snackBar;
}
