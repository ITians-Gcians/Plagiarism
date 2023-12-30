import 'dart:async';
import 'package:flutter/material.dart';
import '/screens/Splash%20screens/oval_screen.dart';

import '../bottom_bar_screen.dart';
import 'aniamted_screen.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  int _currentIndex = 0;
  // ignore: unused_field
  double _opacity = 1.0;
  late Timer _timer;
  List<Widget> screens = [
    OvalScreen(),
    MyAnimatedTexts(),
    BottombarScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _opacity = 0.0;
      });

      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % screens.length;
          _opacity = 1.0;
          if (_currentIndex == screens.length - 1) {
            _timer.cancel();
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          child: Visibility(
            key: ValueKey<int>(_currentIndex),
            visible: true,
            child: screens[_currentIndex],
          ),
        ),
      ),
    );
  }
}
