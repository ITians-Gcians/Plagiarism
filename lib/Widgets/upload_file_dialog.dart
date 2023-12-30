import 'package:flutter/material.dart';
import '../utils/images.dart';

showUploadDialog(BuildContext context, Function(List<String>) _pickFile) {
  // final Animation<double> animation = CurvedAnimation(
  //   parent: ModalRoute.of(context)!.animation!,
  //   curve: Curves.easeInOut,
  // );

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
        title: const Text(
          'Upload File',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Select the file format to upload your file'),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                        onTap: () {
                          _pickFile(['pdf']);
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          Images.pdf,
                          height: 40,
                        )),
                    GestureDetector(
                        onTap: () {
                          _pickFile(
                            ['docx', 'doc'],
                          );
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          Images.docx,
                          height: 40,
                        )),
                    // GestureDetector(
                    //     onTap: () {
                    //       _pickFile(
                    //         'doc',
                    //       );
                    //       Navigator.pop(context);
                    //     },
                    //     child: Image.asset(
                    //       Images.doc,
                    //       height: 40,
                    //     )),
                    GestureDetector(
                        onTap: () {
                          _pickFile(['txt']);
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          Images.txt,
                          height: 40,
                        )),
                  ],
                ),
              ],
            ),
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      );
    },
  );
}
