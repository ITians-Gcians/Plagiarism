import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int wordCount;
  Counter({
    required this.wordCount,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: deviceSize.width * 0.07,
        ),
        Container(
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 2.0, // Adjust the width of the border as needed
            ),
            color: Colors.white,
          ),
          child: Center(
            child: Icon(
              Icons.question_mark_sharp, size: 14,
              color: Colors.black, // Set the color of the icon
            ),
          ),
        ),
        SizedBox(
          width: deviceSize.width * 0.03,
        ),
        Text(
          'Good Result contain only 500 characters',
          style: TextStyle(fontSize: 10),
        ),
        SizedBox(
          width: deviceSize.width * 0.07,
        ),
        Text(
          ' ${wordCount}\\500',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
