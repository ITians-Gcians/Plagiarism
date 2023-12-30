// import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';

// import '../Widgets/counter.dart';
// import '../Widgets/elevatedbutton_dialog.dart';
// import '../Widgets/empty_dialog.dart';
// import '../Widgets/file_upload_button.dart';
// import '../Widgets/pick_file.dart';
// import '../Widgets/result.dart';
// import '../Widgets/title.dart';
// import '../Widgets/upload_file_dialog.dart';
// import '../provider.dart/plag_provider.dart';
// import '../theme/app_decoration.dart';
// import '../theme/style.dart';

// class WordChangerScreen extends StatefulWidget {
//   @override
//   State<WordChangerScreen> createState() => _WordChangerScreenState();
// }

// class _WordChangerScreenState extends State<WordChangerScreen> {
//   final FocusNode _titleFocusNode = FocusNode();
//   bool isloading = false;
//   int wordCount = 0;

//   // Future<void> _pickFile(String expectedFileType) async {
//   //   setState(() {
//   //     isloading = true;
//   //   });
//   //   await pickFile(
//   //       expectedFileType,
//   //       context,

//   //       Provider.of<PlagProvider>(context, listen: false).controllerTitle!,
//   //       updateCharCount);
//   //   setState(() {
//   //     isloading = false;
//   //   });
//   // }
//   Future<void> _pickFile(List<String> expectedFileType) async {
//     await pickFile(
//         expectedFileType,
//         context,
//         Provider.of<PlagProvider>(context, listen: false).controllerTitle!,
//         updateCharCount, (bool loading) {
//       setState(() {
//         isloading = loading;
//       });
//     });
//   }

//   void updateCharCount(String text) {
//     setState(() {
//       wordCount = text.length;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     Provider.of<PlagProvider>(context, listen: false).instantiateController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Consumer<PlagProvider>(
//       builder: (context, plagProvider, child) {
//         return SingleChildScrollView(
//           child: Stack(
//             children: [
//               Positioned(
//                 top: 40,
//                 left: 25,
//                 child: Text(
//                   'Words Changer',
//                   style: Style.TEXT,
//                 ),
//               ),
//               Column(
//                 children: [
//                   SizedBox(
//                     height: deviceSize.height * 0.03,
//                   ),
//                   FileUploadButton(
//                     onPressed: () {
//                       showUploadDialog(
//                         context,
//                         _pickFile,
//                       );
//                     },
//                   ),
//                   Titlewidget(
//                     focusNode: _titleFocusNode,
//                     controller: plagProvider.controllerTitle!,
//                     onChanged: updateCharCount,
//                     wordCount: wordCount,
//                     isLoading: isloading,
//                   ),
//                   Counter(wordCount: plagProvider.controllerTitle!.text.length),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.023,
//                   ),
//                   SizedBox(
//                     height: deviceSize.height * 0.023,
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (plagProvider.controllerTitle!.text.isEmpty) {
//                         EmptyDialog(context);
//                       } else {
//                         //  Split the entered text into words
//                         // List<String> words = _controllerTitle!.text.split(' ');

//                         if (wordCount > 500) {
//                           ElebuttonDialog(context);
//                         } else {
//                           plagProvider.addItem(
//                               plagProvider.controllerTitle!.text, 0);
//                         }
//                       }
//                     },
//                     style: AppDecoration.elevatedbutton,
//                     child: Text(
//                       'Remove Plagiarism',
//                       style: Style.eleButtom,
//                     ),
//                   ),
//                   if (plagProvider.items.isNotEmpty &&
//                       plagProvider.controllerResult!.text.isNotEmpty)
//                     Result(plagProvider.controllerResult!)
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// // import 'dart:convert';

import 'package:flutter/material.dart';
import '../Widgets/animated_dialog.dart';
import '../Widgets/counter.dart';

import '../Widgets/elevatedbutton_dialog.dart';
import '../Widgets/pick_file.dart';

import 'package:provider/provider.dart';

import '../Widgets/empty_dialog.dart';
import '../Widgets/file_upload_button.dart';
import '../Widgets/result.dart';
import '../Widgets/title.dart';
import '../Widgets/upload_file_dialog.dart';
import '../provider.dart/plag_provider.dart';
import '../theme/app_decoration.dart';
import '../theme/style.dart';

class WordChangerScreen extends StatefulWidget {
  // final BuildContext parentContext;

  // AIScreen({Key? key, required this.parentContext}) : super(key: key);

  @override
  State<WordChangerScreen> createState() => _WordChangerScreenState();
}

class _WordChangerScreenState extends State<WordChangerScreen> {
  bool isLoading = false;
  bool loadingAniamtion = false;
  final FocusNode _titleFocusNode = FocusNode();

  int wordCount = 0;

  Future<void> _pickFile(List<String> expectedFileType) async {
    setState(() {
      isLoading = true;
    });
    await pickFile(
      expectedFileType,
      context,
      Provider.of<PlagProvider>(context, listen: false).controllerTitle!,
      updateCharCount,
      (bool loading) {
        setState(() {
          isLoading = loading;
        });
      },
    );
    setState(() {
      isLoading = false;
    });
  }

  void updateCharCount(String text) {
    setState(() {
      wordCount = text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    Provider.of<PlagProvider>(context, listen: false).instantiateController();
  }

  bool button = false;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Consumer<PlagProvider>(
      builder: (context, plagProvider, child) {
        print(".... ${plagProvider.controllerResult!.text}");
        return SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: 40,
                left: 25,
                child: Text(
                  'Words Changer',
                  style: Style.TEXT,
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.03,
                  ),
                  FileUploadButton(
                    onPressed: () {
                      showUploadDialog(
                        context,
                        _pickFile,
                      );
                    },
                  ),
                  Titlewidget(
                    focusNode: _titleFocusNode,
                    controller: plagProvider.controllerTitle!,
                    onChanged: updateCharCount,
                    wordCount: wordCount,
                    isLoading: isLoading,
                  ),
                  Counter(wordCount: plagProvider.controllerTitle!.text.length),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.023,
                  ),
                  SizedBox(
                    height: deviceSize.height * 0.023,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      if (loadingAniamtion) {
                        return;
                      }

                      if (plagProvider.controllerTitle!.text.isEmpty) {
                        EmptyDialog(context);
                      } else if (wordCount > 500) {
                        ElebuttonDialog(context);
                      } else {
                        AnimatedDialog(context);

                        try {
                          setState(() {
                            loadingAniamtion = true;
                          });

                          // Make the server request
                          await plagProvider.addItem(
                              plagProvider.controllerTitle!.text, 1);

                          // Handle successful response (if needed)
                          // For example, you can update the UI here
                        } catch (error) {
                          // Handle errors (if needed)
                        } finally {
                          // Hide the loading dialog
                          Navigator.of(context).pop();

                          // After the loading is complete, set loading to false
                          setState(() {
                            loadingAniamtion = false;
                          });
                        }
                      }
                    },
                    style: AppDecoration.elevatedbutton,
                    child: Text(
                      'Remove Plagiarism',
                      style: Style.eleButtom,
                    ),
                  ),
                  if (!loadingAniamtion &&
                      plagProvider.items.isNotEmpty &&
                      plagProvider.controllerResult!.text.isNotEmpty)
                    Result(plagProvider.controllerResult!)
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
