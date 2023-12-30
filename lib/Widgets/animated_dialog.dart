import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/color.dart';

void AnimatedDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Center(
          child: LoadingAnimationWidget.hexagonDots(
            color: CustomColors.PRIMECOLOR,
            size: 50,
          ),
        ),
      );
    },
  );
}
