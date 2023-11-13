import 'package:flutter/material.dart';

Widget textFieldEmailRoundedWidget({
  required String label,
  required String hint,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    autocorrect: false,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      contentPadding: const EdgeInsets.all(15.0),
    ),
  );
}
