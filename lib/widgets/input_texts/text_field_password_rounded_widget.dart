import 'package:flutter/material.dart';

Widget textFieldPasswordRoundedWidget({
  required String label,
  required String hint,
  required TextEditingController controller,
  required bool hidenPassword,
  required Function togglePasswordVisibility,
}) {
  return TextField(
    controller: controller,
    obscureText: hidenPassword,
    keyboardType: TextInputType.text,
    autocorrect: false,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      contentPadding: const EdgeInsets.all(15.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      suffixIcon: IconButton(
        onPressed: () => togglePasswordVisibility(),
        icon: hidenPassword
            ? const Icon(Icons.visibility_off)
            : const Icon(Icons.visibility),
      ),
    ),
  );
}
