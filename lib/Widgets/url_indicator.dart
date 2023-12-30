// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/provider.dart/checker_provider.dart';
// import 'package:percent_indicator/percent_indicator.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../theme/app_decoration.dart';
// import '../theme/style.dart';

// class URL_Indicator extends StatelessWidget {
//   final Uri _url = Uri.parse('https://www.google.com');
//   Future<void> _launchUrl() async {
//     if (!await launchUrl(_url)) {
//       throw Exception('Could not launch $_url');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     final checkerprovider =
//         Provider.of<CheckerProvider>(context, listen: false);
//     return Column(
//       children: [
//         SizedBox(
//           height: deviceSize.height * 0.05,
//         ),
//         Padding(
//           padding: const EdgeInsets.only(right: 219.0),
//           child: Text(
//             'Result',
//             style: Style.TEXT,
//           ),
//         ),
//         SizedBox(
//           height: deviceSize.height * 0.017,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: deviceSize.width * 0.055,
//             ),
//             Container(
//                 width: deviceSize.width * 0.017,
//                 height: deviceSize.height * 0.008,
//                 decoration: AppDecoration.green_conta),
//             SizedBox(
//               width: deviceSize.width * 0.055,
//             ),
//             Text('Original', style: Style.original)
//           ],
//         ),
//         SizedBox(
//           height: deviceSize.height * 0.01,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: deviceSize.width * 0.055,
//             ),
//             Container(
//                 width: deviceSize.width * 0.017,
//                 height: deviceSize.height * 0.008,
//                 decoration: AppDecoration.cir_conta),
//             SizedBox(
//               width: deviceSize.width * 0.055,
//             ),
//             Text('Plagiarised', style: Style.plagiarism)
//           ],
//         ),
//         SizedBox(
//           height: deviceSize.height * 0.03,
//         ),
//         Container(
//           width: deviceSize.width * 0.73,
//           height: deviceSize.height * 0.29,
//           decoration: AppDecoration.urlCont,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: deviceSize.height * 0.02,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 180.0),
//                 child: Text('URL:', style: Style.url),
//               ),
//               SizedBox(
//                 height: deviceSize.height * 0.02,
//               ),
//               TextButton(
//                 onPressed: _launchUrl,
//                 child: Text(

//                    'https://www.google.com',
//                   style: TextStyle(
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: deviceSize.height * 0.02,
//               ),
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 50,
//                 child: new CircularPercentIndicator(
//                   radius: 50.0,
//                   animation: true,
//                   animationDuration: 1200,
//                   lineWidth: 15.0,
//                   percent: 0.4,
//                   center: new Text(

//                      "40 hours",
//                     style: new TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 12.0),
//                   ),
//                   circularStrokeCap: CircularStrokeCap.butt,
//                   progressColor: Color(0xFF3A9D3E),
//                   backgroundColor: Color(0xFFB80B0B),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: deviceSize.height * 0.024,
//         ),
//         Container(
//           width: deviceSize.width * 0.73,
//           height: deviceSize.height * 0.28,
//           decoration: AppDecoration.urlCont,
//           child: Column(
//             children: [
//               SizedBox(
//                 height: deviceSize.height * 0.02,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 180.0),
//                 child: Text('URL:', style: Style.url),
//               ),
//               SizedBox(
//                 height: deviceSize.height * 0.02,
//               ),
//               TextButton(
//                 onPressed: _launchUrl,
//                 child: Text(
//                   'https://www.google.com',
//                   style: TextStyle(
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: deviceSize.height * 0.02,
//               ),
//               new CircularPercentIndicator(
//                 radius: 50.0,
//                 lineWidth: 13.0,
//                 animation: true,
//                 percent: 0.7,
//                 center: new Text(
//                   "70.0%",
//                   style: new TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 20.0),
//                 ),
//                 // footer: new Text(
//                 //   "Sales this week",
//                 //   style: new TextStyle(
//                 //       fontWeight: FontWeight.bold, fontSize: 17.0),
//                 // ),
//                 circularStrokeCap: CircularStrokeCap.round,
//                 progressColor: Color(0xFF3A9D3E),
//                 backgroundColor: Color(0xFFB80B0B),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: deviceSize.height * 0.02,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/provider.dart/checker_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/app_decoration.dart';
import '../theme/style.dart';

class URL_Indicator extends StatelessWidget {
  final Uri _url = Uri.parse('https://www.google.com');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: deviceSize.height * 0.05,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 219.0),
          child: Text(
            'Result',
            style: Style.TEXT,
          ),
        ),
        SizedBox(
          height: deviceSize.height * 0.017,
        ),
        Row(
          children: [
            SizedBox(
              width: deviceSize.width * 0.055,
            ),
            Container(
                width: deviceSize.width * 0.017,
                height: deviceSize.height * 0.008,
                decoration: AppDecoration.green_conta),
            SizedBox(
              width: deviceSize.width * 0.055,
            ),
            Text('Original', style: Style.original),
          ],
        ),
        SizedBox(
          height: deviceSize.height * 0.01,
        ),
        Row(
          children: [
            SizedBox(
              width: deviceSize.width * 0.055,
            ),
            Container(
                width: deviceSize.width * 0.017,
                height: deviceSize.height * 0.008,
                decoration: AppDecoration.cir_conta),
            SizedBox(
              width: deviceSize.width * 0.055,
            ),
            Text('Plagiarised', style: Style.plagiarism),
          ],
        ),
        SizedBox(
          height: deviceSize.height * 0.03,
        ),
        Consumer<CheckerProvider>(
          builder: (context, checkerprovider, child) {
            List<Map<String, dynamic>> matches = checkerprovider.matches;

            return Column(
              children: [
                if (matches.isNotEmpty)
                  for (int index = 0; index < matches.length; index++)
                    Column(
                      children: [
                        Container(
                          width: deviceSize.width * 0.73,
                          height: deviceSize.height * 0.31,
                          decoration: AppDecoration.urlCont,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: deviceSize.height * 0.02,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 180.0),
                                  child: Text('URL:', style: Style.url),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.02,
                                ),
                                // for (int index = 0; index < matches.length; index++)

                                TextButton(
                                  onPressed: _launchUrl,
                                  child: Text(
                                    'URL: ${matches[index]['url']}',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child: CircularPercentIndicator(
                                    radius: 50.0,
                                    animation: true,
                                    animationDuration: 1200,
                                    lineWidth: 15.0,
                                    percent: double.parse(
                                            matches[index]['percent']) /
                                        100.0,
                                    center: Text(
                                      "${matches[index]['percent']}%",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                    circularStrokeCap: CircularStrokeCap.butt,
                                    progressColor: Color(0xFFB80B0B),
                                    backgroundColor: Color(0xFF3A9D3E),
                                  ),
                                ),
                                SizedBox(
                                  height: deviceSize.height * 0.024,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.024,
                        ),
                      ],
                    ),
              ],
            );
          },
        ),
        SizedBox(
          height: deviceSize.height * 0.024,
        ),
        Consumer<CheckerProvider>(
          builder: (context, checkerprovider, child) {
            List<Map<String, dynamic>> matches = checkerprovider.matches;

            return Column(
              children: [
                if (matches.isEmpty)
                  Container(
                    width: deviceSize.width * 0.73,
                    height: deviceSize.height * 0.28,
                    decoration: AppDecoration.urlCont,
                    child: Column(
                      children: [
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 180.0),
                          child: Text('URL:', style: Style.url),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        TextButton(
                          onPressed: _launchUrl,
                          child: Text(
                            'https://www.google.com',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceSize.height * 0.02,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: CircularPercentIndicator(
                            radius: 50.0,
                            animation: true,
                            animationDuration: 1200,
                            lineWidth: 15.0,
                            percent: 0,
                            center: Text(
                              '100 %',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            circularStrokeCap: CircularStrokeCap.butt,
                            progressColor: Color(0xFFB80B0B),
                            backgroundColor: Color(0xFF3A9D3E),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
        SizedBox(
          height: deviceSize.height * 0.02,
        ),
      ],
    );
  }
}

  // Container(
  //                   width: deviceSize.width * 0.73,
  //                   height: deviceSize.height * 0.28,
  //                   decoration: AppDecoration.urlCont,
  //                   child: Column(
  //                     children: [
  //                       SizedBox(
  //                         height: deviceSize.height * 0.02,
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(right: 180.0),
  //                         child: Text('URL:', style: Style.url),
  //                       ),
  //                       SizedBox(
  //                         height: deviceSize.height * 0.02,
  //                       ),
  //                       TextButton(
  //                         onPressed: _launchUrl,
  //                         child: Text(
  //                            'URL: ${matches[index]['url']}',
  //                           style: TextStyle(
  //                             decoration: TextDecoration.underline,
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: deviceSize.height * 0.02,
  //                       ),
  //                       CircleAvatar(
  //                         backgroundColor: Colors.white,
  //                         radius: 50,
  //                         child: CircularPercentIndicator(
  //                           radius: 50.0,
  //                           animation: true,
  //                           animationDuration: 1200,
  //                           lineWidth: 15.0,
  //                           percent: double.parse(
  //                                           matches[index]['percent']) /
  //                                       100.0,
  //                                   center: Text(
  //                                     "${matches[index]['percent']}%",
  //                                     style: TextStyle(
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12.0,
  //                                     ),
  //                                   ),
  //                           circularStrokeCap: CircularStrokeCap.butt,
  //                           progressColor: Color(0xFFB80B0B),
  //                           backgroundColor: Color(0xFF3A9D3E),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),