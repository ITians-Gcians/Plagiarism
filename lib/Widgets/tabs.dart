import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
    required this.selectedTabIndex,
    required this.text,
    required this.imagePath,
    required this.tabIndex,
  }) : super(key: key);

  final bool selectedTabIndex;
  final String text;
  final String imagePath;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            color: selectedTabIndex ? Colors.black : Colors.white,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: selectedTabIndex ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
