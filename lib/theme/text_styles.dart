import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: Colors.black87,
    height: 1.5, // Line height
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: Colors.grey,
    fontStyle: FontStyle.italic,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}
