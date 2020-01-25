import 'package:flutter/material.dart';

class ChatStyles {
  ChatStyles._();

  static final TextStyle headerStyle = TextStyle(
    fontSize: 36,
    color: Colors.white,
  );

  static final TextStyle actionText = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle whiteActionText = TextStyle(
    color: Colors.white,
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle hintStyle = TextStyle(
    color: Colors.black87,
  );

  static final TextStyle whiteHintStyle = TextStyle(
    color: Colors.white,
  );

  static final TextStyle tinyActionText = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );

  static final TextStyle whiteTinyActionText = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
  );
}
