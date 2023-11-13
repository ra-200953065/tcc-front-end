import 'package:flutter/material.dart';

Widget textFieldNameSquareWidget({
  required String label,
  required String hint,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.text,
    textCapitalization: TextCapitalization.words,
    decoration: InputDecoration(
      hintText: hint,
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.all(15.0),
    ),
  );
}
