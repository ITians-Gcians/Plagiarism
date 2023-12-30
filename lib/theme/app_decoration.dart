import 'package:flutter/material.dart';

class AppDecoration {
  static BoxDecoration get gradientColor => BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pinkAccent, Colors.yellowAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
        ),
        borderRadius: BorderRadius.circular(20),
      );
  static var container = ShapeDecoration(
    //color: Colors.blue,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 0.50,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Colors.black.withOpacity(0.4000000059604645),
      ),
      borderRadius: BorderRadius.circular(4),
    ),
  );
  static var textFieldTitle = InputDecoration(
    border: InputBorder.none,
    hintText: 'Original Text Here...',
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.4),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  );
  static var textFieldResult = InputDecoration(
    border: InputBorder.none,
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.4),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  );
  static var elevatedbutton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
        Color(0xFFE96522)), // Set background color
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Set radius
      ),
    ),
  );
  static var dialogButton = ShapeDecoration(
    color: Color(0xFFB80B0B),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.01),
    ),
  );
  static var dialogcon1 = ShapeDecoration(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
  static var dialogcont2 = ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
  static var dialogtextbutton = ShapeDecoration(
    color: Colors.black,
    shape: OvalBorder(),
  );
  static var cir_conta = ShapeDecoration(
    color: Color(0xFFB80B0B),
    shape: OvalBorder(),
  );
  static var green_conta = ShapeDecoration(
    color: Color(0xFF3A9D3E),
    shape: OvalBorder(),
  );
  static var appbarconta = BoxDecoration(
    color: Colors.black,
    boxShadow: [
      BoxShadow(
        color: Color(0x3F000000),
        blurRadius: 4,
        offset: Offset(0, 4),
        spreadRadius: 0,
      )
    ],
  );
  static var urlCont = ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        width: 0.50,
        strokeAlign: BorderSide.strokeAlignCenter,
        color: Colors.black.withOpacity(0.4000000059604645),
      ),
      borderRadius: BorderRadius.circular(4),
    ),
  );
  static var your_name = InputDecoration(
    border: InputBorder.none,
    hintText: 'Your Name',
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.4),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
  );
  static var fieldcontainer = ShapeDecoration(
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
    shadows: [
      BoxShadow(
        color: Color(0x26000000),
        blurRadius: 8,
        offset: Offset(0, 5),
        spreadRadius: 0,
      )
    ],
  );
  static var email = InputDecoration(
    border: InputBorder.none,
    hintText: 'Your Email',
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.4),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
  );
  static var descr = InputDecoration(
    border: InputBorder.none,
    hintText: 'Your Message',
    hintStyle: TextStyle(
      color: Colors.black.withOpacity(0.4),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      height: 0,
    ),
    alignLabelWithHint: true,
    contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  );
}
