import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart/checker_provider.dart';
import '../screens/checker_screen.dart';
import '../screens/menu_screen.dart';
import '../screens/rephrase.dart';
import '../utils/images.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'remover_screen.dart';

class BottombarScreen extends StatefulWidget {
  @override
  _BottombarScreenState createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  int _selectedIndex = 0;
  late PageController _pageController;
  double _currentPage = 0.0;

  List<Widget> _widgetOptions = <Widget>[
    RemoverScreen(),
    CheckerScreen(),
    Rephrase(),
    MenuScreen()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _selectedIndex,
      viewportFraction: 1.0,
    );

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size.width * 0.055;
    final checker = Provider.of<CheckerProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: _widgetOptions.length,
        onPageChanged: (value) {
          setState(() {
            _selectedIndex = value;

            if (_selectedIndex == 1 && checker.buttonPressed) {
              checker.setButtonPressed(false);
              checker.controllerTitle!.clear();
            }
          });
        },
        itemBuilder: (context, index) {
          double opacity = 1.0 - (_currentPage - index).abs();

          return Opacity(
            opacity: opacity.clamp(0.0, 1.0),
            child: _widgetOptions[index],
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFE96522),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Color(0xFFE96522).withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.black,
              color: Colors.white,
              tabs: [
                GButton(
                  leading: Image.asset(
                    Images.remover,
                    color: Colors.white,
                    width: mediaSize,
                    scale: 0.3,
                  ),
                  icon: Icons.done,
                  text: 'Remover',
                ),
                GButton(
                  leading: Image.asset(
                    Images.checker,
                    width: mediaSize,
                    scale: 0.3,
                  ),
                  icon: Icons.done,
                  text: 'Checker',
                ),
                GButton(
                  leading: Image.asset(
                    Images.rephrase,
                    width: mediaSize,
                    height: 17,
                  ),
                  icon: Icons.done,
                  text: 'Rephrase',
                ),
                GButton(
                  leading: Image.asset(
                    Images.menu,
                    width: mediaSize,
                    scale: 0.3,
                  ),
                  icon: Icons.done,
                  text: 'Menu',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                _selectedIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
