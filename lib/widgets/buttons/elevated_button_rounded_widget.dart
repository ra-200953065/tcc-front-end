import 'package:flutter/material.dart';

Widget elevatedButtonRoundedWidget({
  required BuildContext context,
  required String label,
  required Function action,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 50,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16.0),
      ),
      onPressed: () => action(),
    ),
  );
}
