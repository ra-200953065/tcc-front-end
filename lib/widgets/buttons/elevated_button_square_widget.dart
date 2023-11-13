import 'package:flutter/material.dart';

Widget elevatedButtonSquareWidget({
  required BuildContext context,
  required String label,
  required Function action,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      child: Text(
        label,
        style: const TextStyle(fontSize: 16.0),
      ),
      onPressed: () => action(),
    ),
  );
}
