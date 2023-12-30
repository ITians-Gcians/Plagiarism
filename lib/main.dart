// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'provider.dart/checker_provider.dart';
// import 'provider.dart/plag_provider.dart';
// import 'package:provider/provider.dart';

// import 'screens/Splash screens/fade_transition.dart';
// import 'screens/contact_screen.dart';
// import 'screens/privacy_policy_screen.dart';
// import 'screens/terms&condition_screen.dart';
// import 'utils/color.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (ctx) => PlagProvider()),
//         ChangeNotifierProvider(create: (ctx) => CheckerProvider()),
//       ],
//       child: MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Plagiarism',
//           theme: ThemeData(
//               primarySwatch: Colors.purple,
//               primaryColor: Colors.white,
//               hintColor: Colors.blue,
//               fontFamily: 'Quicksand',
//               textTheme: ThemeData.light().textTheme.copyWith(
//                     titleMedium: TextStyle(
//                         fontFamily: 'OpenSans',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Colors.pink),
//                   ),
//               appBarTheme: AppBarTheme(
//                 titleTextStyle: ThemeData.light()
//                     .appBarTheme
//                     .copyWith(
//                       titleTextStyle: TextStyle(
//                           fontFamily: 'Quicksand',
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                           height: 0,
//                           color: CustomColors.PRIMECOLOR),
//                     )
//                     .titleTextStyle,
//               )),
//           home: MyPageView(),
//           routes: {
//             ContactScreen.routename: (ctx) => ContactScreen(),
//             PrivacyPolicyScreen.routename: (ctx) => PrivacyPolicyScreen(),
//             ConditionScreen.routename: (ctx) => ConditionScreen()
//           }),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider.dart/checker_provider.dart';
import 'provider.dart/plag_provider.dart';
import 'provider.dart/theme_provider.dart';
import 'screens/Splash screens/fade_transition.dart';
import 'screens/contact_screen.dart';
import 'screens/privacy_policy_screen.dart';
import 'screens/terms&condition_screen.dart';
import 'utils/color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PlagProvider()),
        ChangeNotifierProvider(create: (ctx) => CheckerProvider()),
        ChangeNotifierProvider<ThemeProvider>(
          create: (ctx) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Plagiarism',
            themeMode: themeProvider.getThemeMode(),
            theme: lightTheme,
            darkTheme: darkTheme,
            home: MyPageView(),
            routes: {
              ContactScreen.routename: (ctx) => ContactScreen(),
              PrivacyPolicyScreen.routename: (ctx) => PrivacyPolicyScreen(),
              ConditionScreen.routename: (ctx) => ConditionScreen(),
            },
          );
        },
      ),
    );
  }

  final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.purple,
    primaryColor: Colors.white,
    hintColor: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white, // Change background color for light theme
      titleTextStyle: TextStyle(
        fontFamily: 'Quicksand',
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 0,
        color: CustomColors.PRIMECOLOR,
      ),
    ),
  );

  final ThemeData darkTheme = ThemeData.dark().copyWith(
    // Customize dark theme properties here
    appBarTheme: AppBarTheme(
      backgroundColor:
          Colors.grey[800], // Change background color for dark theme
    ),
  );
}
