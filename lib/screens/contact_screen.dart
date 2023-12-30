import 'package:flutter/material.dart';

import '../Widgets/textfield_cont.dart';

class ContactScreen extends StatelessWidget {
  static const routename = '/contact';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              centerTitle: true,
              title: Text(
                'Contact Us',
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
          ];
        },
        body: SingleChildScrollView(
          child: TextFieldContainer(),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import '../Widgets/textfield_cont.dart';

// class ContactScreen extends StatefulWidget {
//   static const routename = '/contact';

//   @override
//   _ContactScreenState createState() => _ContactScreenState();
// }

// class _ContactScreenState extends State<ContactScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 1),
//     );
//     _animationController.forward();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _animationController,
//         builder: (BuildContext context, Widget? child) {
//           return Opacity(
//             opacity: _animationController.value,
//             child: NestedScrollView(
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return [
//                   SliverAppBar(
//                     pinned: true,
//                     centerTitle: true,
//                     title: Text('Contact Us'),
//                     backgroundColor: Theme.of(context)
//                         .primaryColor, // Use the color you want directly
//                   ),
//                 ];
//               },
//               body: SingleChildScrollView(
//                 child: TextFieldContainer(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }
// }
