
import 'package:flutter/material.dart';

Widget textFieldEmailSquareWidget({
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
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.all(15.0),
    ),
  );
}
