import 'package:flutter/material.dart';

class Charactersno extends StatelessWidget {
  final int wordCount;
  Charactersno({
    required this.wordCount,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ' $wordCount',
      style: TextStyle(color: Colors.grey),
    );
  }
}
