import 'package:flutter/material.dart';

abstract class TextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body = TextStyle(fontSize: 16);

  static const TextStyle button = TextStyle(fontSize: 14);
  static const TextStyle caption = TextStyle(fontSize: 12);
}
