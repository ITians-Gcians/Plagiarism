import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_decoration.dart';

class OvalScreen extends StatefulWidget {
  @override
  _OvalScreenState createState() => _OvalScreenState();
}

class _OvalScreenState extends State<OvalScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: AppDecoration.gradientColor,
              child: SlideTransition(
                position: _offsetAnimation,
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.312,
                      height: MediaQuery.of(context).size.height * 0.143,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: OvalBorder(),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
