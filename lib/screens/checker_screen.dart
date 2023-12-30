import 'package:flutter/material.dart';
import '../Widgets/animated_dialog.dart';
import '../provider.dart/checker_provider.dart';
import '../Widgets/characters.dart';
import '../Widgets/file_upload_button.dart';
import '../Widgets/empty_dialog.dart';
import '../Widgets/pick_file.dart';
import '../Widgets/title.dart';
import '../Widgets/upload_file_dialog.dart';
import '../Widgets/url_indicator.dart';
import 'package:provider/provider.dart';
import '../utils/Strings.dart';
import '../theme/app_decoration.dart';
import '../theme/style.dart';
import '../utils/images.dart';

class CheckerScreen extends StatefulWidget {
  const CheckerScreen({super.key});

  @override
  State<CheckerScreen> createState() => _CheckerScreenState();
}

class _CheckerScreenState extends State<CheckerScreen> {
  final FocusNode _titleFocusNode = FocusNode();
  bool isloading = false;
  bool loadingAniamtion = false;
  int wordCount = 0;

  void updateCharCount(String text) {
    setState(() {
      wordCount = text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    // Call fetchData when the widget is initialized
    final checkerProvider =
        Provider.of<CheckerProvider>(context, listen: false);
    if (checkerProvider.controllerTitle == null) {
      checkerProvider.checkerController(); // Initialize controller if null
    }
    checkerProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: Container(
            padding: EdgeInsets.all(15.0),
            child: Image.asset(
              Images.logo,
            ),
          ),
          title: Text(
            Strings.plagiarism_checker,
          ),
        ),
        body: Consumer<CheckerProvider>(
          builder: (context, checkerProvider, child) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 25,
                    child: Text(
                      'Checker',
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
                        controller: checkerProvider.controllerTitle!,
                        onChanged: updateCharCount,
                        wordCount: wordCount,
                        isLoading: isloading,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 280.0),
                        child: Charactersno(
                            wordCount:
                                checkerProvider.controllerTitle!.text.length),
                      ),
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
                          if (checkerProvider.controllerTitle!.text
                                  .split(' ')
                                  .length <
                              15) {
                            EmptyDialog(context);
                          } else {
                            AnimatedDialog(context);

                            try {
                              setState(() {
                                loadingAniamtion = true;
                              });

                              await checkerProvider.fetchData();
                              setState(() {
                                checkerProvider.setButtonPressed(true);
                              });
                            } catch (error) {
                              print('Error fetching data: $error');
                            } finally {
                              Navigator.of(context).pop();
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
                      if (checkerProvider.buttonPressed && !loadingAniamtion)
                        URL_Indicator()
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }

  Future<void> _pickFile(List<String> expectedFileType) async {
    setState(() {
      isloading = true;
    });
    await pickFile(
        expectedFileType,
        context,
        Provider.of<CheckerProvider>(context, listen: false).controllerTitle!,
        updateCharCount, (bool loading) {
      setState(() {
        isloading = loading;
      });
    });
    setState(() {
      isloading = false;
    });
  }
}
