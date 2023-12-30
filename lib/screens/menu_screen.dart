// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../provider.dart/theme_provider.dart';
// import 'terms&condition_screen.dart';
// import '../screens/contact_screen.dart';
// import '../screens/privacy_policy_screen.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../theme/style.dart';
// import '../utils/Strings.dart';
// import '../utils/images.dart';

// class MenuScreen extends StatelessWidget {
//   MenuScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         toolbarHeight: deviceSize.height * 0.1,
//         backgroundColor: Theme.of(context).primaryColor,
//         leading: Container(
//           padding: EdgeInsets.all(15.0),
//           child: Image.asset(
//             Images.logo,
//           ),
//         ),
//         title: Text(
//           Strings.plagiarism_menu,
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           children: [
//             SizedBox(
//               height: deviceSize.height * 0.1,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed(ContactScreen.routename);
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: deviceSize.width * 0.06),
//                     SizedBox(
//                         height: deviceSize.height * 0.026,
//                         child:
//                             Image.asset(Images.contact, color: Colors.black)),
//                     SizedBox(width: deviceSize.width * 0.04),
//                     Text('Contact Us', style: Style.contact),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: deviceSize.height * 0.02,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed(PrivacyPolicyScreen.routename);
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: deviceSize.width * 0.06),
//                     SizedBox(
//                         height: deviceSize.height * 0.026,
//                         child: Image.asset(Images.privacy)),
//                     SizedBox(width: deviceSize.width * 0.04),
//                     Text('Privacy Policy', style: Style.contact),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: deviceSize.height * 0.02,
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).pushNamed(ConditionScreen.routename);
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: deviceSize.width * 0.05),
//                     SizedBox(
//                         height: deviceSize.height * 0.035,
//                         child: Image.asset(
//                           Images.terms,
//                         )),
//                     SizedBox(width: deviceSize.width * 0.021),
//                     Text('Terms & Conditions', style: Style.contact),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: deviceSize.height * 0.02,
//             ),
//             InkWell(
//               onTap: _launchUrl,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: deviceSize.width * 0.06),
//                     SizedBox(
//                         height: deviceSize.height * 0.026,
//                         child: Image.asset(Images.apps)),
//                     SizedBox(width: deviceSize.width * 0.04),
//                     Text('More Apps', style: Style.contact),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: deviceSize.height * 0.02,
//             ),
//             InkWell(
//               onTap: () {
//                 Provider.of<ThemeProvider>(context, listen: false)
//                     .toggleTheme();
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   children: [
//                     SizedBox(width: deviceSize.width * 0.05),
//                     SizedBox(
//                         height: deviceSize.height * 0.035,
//                         child: Image.asset(
//                           Images.terms,
//                         )),
//                     SizedBox(width: deviceSize.width * 0.021),
//                     Text('Theme Mode', style: Style.contact),
//                   ],
//                 ),
//               ),
//             ),
//             Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(right: 200.0),
//               child: Image.asset(
//                 Images.menuFrame,
//                 height: deviceSize.height * 0.2,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   final Uri _url = Uri.parse(
//       'https://play.google.com/store/apps/developer?id=MIT+PROGRAMMER');

//   Future<void> _launchUrl() async {
//     if (!await launchUrl(_url)) {
//       throw Exception('Could not launch $_url');
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart/theme_provider.dart';
import 'terms&condition_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/privacy_policy_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/style.dart';
import '../utils/Strings.dart';
import '../utils/images.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: deviceSize.height * 0.1,
        backgroundColor: Theme.of(context).primaryColor,
        leading: Container(
          padding: EdgeInsets.all(15.0),
          child: Image.asset(
            Images.logo,
          ),
        ),
        title: Text(
          Strings.plagiarism_menu,
        ),
      ),
      body: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                SizedBox(
                  height: deviceSize.height * 0.1,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ContactScreen.routename);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: deviceSize.width * 0.06),
                        SizedBox(
                          height: deviceSize.height * 0.026,
                          child:
                              Image.asset(Images.contact, color: Colors.black),
                        ),
                        SizedBox(width: deviceSize.width * 0.04),
                        Text('Contact Us', style: Style.contact),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(PrivacyPolicyScreen.routename);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: deviceSize.width * 0.06),
                        SizedBox(
                          height: deviceSize.height * 0.026,
                          child: Image.asset(Images.privacy),
                        ),
                        SizedBox(width: deviceSize.width * 0.04),
                        Text('Privacy Policy', style: Style.contact),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ConditionScreen.routename);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: deviceSize.width * 0.05),
                        SizedBox(
                          height: deviceSize.height * 0.035,
                          child: Image.asset(Images.terms),
                        ),
                        SizedBox(width: deviceSize.width * 0.021),
                        Text('Terms & Conditions', style: Style.contact),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.02,
                ),
                InkWell(
                  onTap: _launchUrl,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: deviceSize.width * 0.06),
                        SizedBox(
                          height: deviceSize.height * 0.026,
                          child: Image.asset(Images.apps),
                        ),
                        SizedBox(width: deviceSize.width * 0.04),
                        Text('More Apps', style: Style.contact),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceSize.height * 0.02,
                ),
                InkWell(
                  onTap: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        SizedBox(width: deviceSize.width * 0.05),
                        SizedBox(
                          height: deviceSize.height * 0.035,
                          child: Image.asset(Images.terms),
                        ),
                        SizedBox(width: deviceSize.width * 0.021),
                        Text('Theme Mode', style: Style.contact),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 200.0),
                  child: Image.asset(
                    Images.menuFrame,
                    height: deviceSize.height * 0.2,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  final Uri _url = Uri.parse(
      'https://play.google.com/store/apps/developer?id=MIT+PROGRAMMER');

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
