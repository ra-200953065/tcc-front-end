import 'package:flutter/material.dart';

Future<DateTime?> dialogDateWidget(BuildContext context, DateTime? date) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: date ?? DateTime.now(),
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );

  if (picked != null && picked != date) {
    return picked;
  } else {
    return date;
  }
}
