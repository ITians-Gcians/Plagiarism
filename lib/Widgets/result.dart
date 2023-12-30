// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import '../theme/app_decoration.dart';
// import '../theme/style.dart';
// import '../utils/images.dart';

// Widget Result(BuildContext context, TextEditingController controllerResult) {
//   final deviceSize = MediaQuery.of(context).size;

//   return Column(
//     children: [
//       SizedBox(
//         height: deviceSize.height * 0.028,
//       ),
//       Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 20.0),
//             child: Text(
//               'Result',
//               style: Style.TEXT,
//             ),
//           ),
//           SizedBox(
//             width: deviceSize.width * 0.69,
//           ),
//           GestureDetector(
//             onTap: () {
//               Clipboard.setData(ClipboardData(text: controllerResult.text))
//                   .then((_) {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text('Copied to your clipboard !')));
//               });
//             },
//             child: Image.asset(Images.copy),
//           ),
//         ],
//       ),
//       SizedBox(
//         height: deviceSize.height * 0.013,
//       ),
//       Material(
//         elevation: 2,
//         child: Container(
//           width: deviceSize.width * 0.9,
//           height: deviceSize.height * 0.35,
//           decoration: AppDecoration.container,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:
//                 //  AnimatedTextKit(
//                 //   totalRepeatCount: 1,
//                 //   animatedTexts: [
//                 //     TypewriterAnimatedText(
//                 //       //plag.controllerResult!.text,
//                 //       controllerResult.text,
//                 //     ),
//                 //   ],
//                 // ),
//                 Text(
//               controllerResult.text,
//             ),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: deviceSize.height * 0.02,
//       ),
//     ],
//   );
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../theme/app_decoration.dart';
import '../theme/style.dart';
import '../utils/images.dart';

class Result extends StatefulWidget {
  final TextEditingController controllerResult;

  Result(this.controllerResult);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Key _typewriterKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final isLoading = Provider.of<PlagProvider>(context).isLoading;

    return Column(
      children: [
        SizedBox(
          height: deviceSize.height * 0.028,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Result',
                style: Style.TEXT,
              ),
            ),
            SizedBox(
              width: deviceSize.width * 0.69,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(
                        ClipboardData(text: widget.controllerResult.text))
                    .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Copied to your clipboard!')));
                });
              },
              child: Image.asset(Images.copy),
            ),
          ],
        ),
        SizedBox(
          height: deviceSize.height * 0.013,
        ),
        Material(
          elevation: 2,
          child: Container(
            width: deviceSize.width * 0.9,
            height: deviceSize.height * 0.35,
            decoration: AppDecoration.container,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedTextKit(
                key: _typewriterKey,
                totalRepeatCount: 1,
                animatedTexts: [
                  TypewriterAnimatedText(
                    widget.controllerResult.text,
                    // key: _typewriterKey,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: deviceSize.height * 0.02,
        ),
      ],
    );
  }

  // Function to update the text and trigger the restart of TypewriterAnimatedText
  void updateText() {
    setState(() {
      // Do any additional logic here if needed
      _typewriterKey = UniqueKey();
    });
  }

  @override
  void didUpdateWidget(covariant Result oldWidget) {
    super.didUpdateWidget(oldWidget);
    updateText(); // Call updateText when the widget updates
  }
}
