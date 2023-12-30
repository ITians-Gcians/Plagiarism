import 'package:flutter/material.dart';

import '../theme/app_decoration.dart';

class Titlewidget extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController controller;
  final Function onChanged;
  final int wordCount;
  final bool isLoading;

  const Titlewidget({
    required this.focusNode,
    required this.controller,
    required this.onChanged,
    required this.wordCount,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Material(
          elevation: 2,
          child: Container(
            width: deviceSize.width * 0.9,
            height: deviceSize.height * 0.35,
            decoration: AppDecoration.container,
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : TextField(
                    textAlign: TextAlign.start,
                    focusNode: focusNode,
                    maxLines: 10,
                    decoration: AppDecoration.textFieldTitle,
                    controller: controller ?? TextEditingController(),
                    onChanged: (text) => onChanged(text),
                  ),
          ),
        ),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
      ],
    );
  }
}
