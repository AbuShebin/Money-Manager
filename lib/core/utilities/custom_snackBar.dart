import 'package:flutter/material.dart';

void showSnackBar({
  required String content,
  required BuildContext context,
  required Color color,
  bool? delay,
}) {
  final snackBar = SnackBar(
    content: Text(
      content,
      textAlign: TextAlign.center,
      style: const TextStyle(
        letterSpacing: 1.5,
        fontWeight: FontWeight.w600,
        fontSize: 14,
        color: Colors.white,
      ),
    ),
    backgroundColor: color.withOpacity(0.9),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: const EdgeInsets.all(10),
  );

  if (delay != true) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
