import 'package:flutter/material.dart';

Widget textFieldNameRoundedWidget({
  required String label,
  required String hint,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.emailAddress,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      contentPadding: const EdgeInsets.all(15.0),
    ),
  );
}
