import 'package:flutter/material.dart';
import '../theme/style.dart';
import '../utils/Strings.dart';

EmptyDialog(
  BuildContext context,
) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    barrierLabel: 'Upload Dialog',
    transitionDuration: Duration(seconds: 1),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      const double begin = 0.0;
      const double end = 1.0;
      final Tween<double> tween = Tween<double>(begin: begin, end: end);
      final CurvedAnimation curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return Opacity(
        opacity: tween.animate(curvedAnimation).value,
        child: child,
      );
    },
    pageBuilder: (BuildContext buildContext, Animation animation,
        Animation secondaryAnimation) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        title: Center(
          child: Text(
            'No Text',
            style: Style.dialogTitle,
          ),
        ),
        content: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    Strings.dialogText,
                    style: Style.dialogtext,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Divider(),
              ],
            ),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Center(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ),
        ],
      );
    },
  );
}
