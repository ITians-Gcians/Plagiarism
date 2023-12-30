import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../../utils/Strings.dart';
import '../../utils/images.dart';

class MyAnimatedTexts extends StatefulWidget {
  @override
  _MyAnimatedTextsState createState() => _MyAnimatedTextsState();
}

class _MyAnimatedTextsState extends State<MyAnimatedTexts>
    with TickerProviderStateMixin {
  late AnimationController leftToRightController;
  late AnimationController rightToLeftController;
  late AnimationController topToBottomController;
  late AnimationController fadeController;

  @override
  void initState() {
    super.initState();

    leftToRightController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    rightToLeftController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    topToBottomController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    fadeController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      value: 1.0,
    );

    fadeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });

    leftToRightController.forward();
    rightToLeftController.forward();
    topToBottomController.forward();
    fadeController.forward();
  }

  @override
  void dispose() {
    leftToRightController.dispose();
    rightToLeftController.dispose();
    topToBottomController.dispose();
    fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.12,
            ),
            AnimatedBuilder(
              animation: topToBottomController,
              builder: (context, child) {
                return FractionalTranslation(
                  translation: Offset(0.0, topToBottomController.value),
                  child: Opacity(
                      opacity: topToBottomController.value,
                      child: Container(
                        child: Image.asset(
                          Images.logo,
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.17,
                        ),
                      )),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            AnimatedBuilder(
              animation: leftToRightController,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(-1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(leftToRightController),
                  child: Text(
                    Strings.plag,
                    style: Style.plag,
                  ),
                );
              },
            ),
            AnimatedBuilder(
              animation: rightToLeftController,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: Offset(1.0, 0.0),
                    end: Offset(0.0, 0.0),
                  ).animate(rightToLeftController),
                  child: Text(
                    Strings.plag_pro,
                    style: Style.plag_pro,
                  ),
                );
              },
            ),
            Spacer(),
            AnimatedOpacity(
              opacity: fadeController.value,
              duration: Duration(seconds: 2),
              child: Image.asset(
                Images.orangecolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
