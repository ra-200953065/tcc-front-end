import 'package:flutter/material.dart';

Widget textButtonRoundedWidget({
  required BuildContext context,
  required String label,
  required Function action,
}) {
  return TextButton(
    child: Text(
      label,
      style: const TextStyle(fontSize: 16.0),
    ),
    onPressed: () => action(),
  );
}
