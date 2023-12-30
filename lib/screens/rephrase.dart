import 'package:flutter/material.dart';

import 'package:flutter_application_1/Widgets/elevatedbutton_dialog.dart';
import '../Widgets/counter.dart';
import '../Widgets/file_upload_button.dart';
import '../Widgets/pick_file.dart';
import '../Widgets/result.dart';
import '../Widgets/title.dart';
import 'package:provider/provider.dart';
import '../Widgets/empty_dialog.dart';
import '../Widgets/upload_file_dialog.dart';
import '../provider.dart/plag_provider.dart';
import '../theme/app_decoration.dart';
import '../theme/style.dart';
import '../utils/Strings.dart';
import '../utils/images.dart';

class Rephrase extends StatefulWidget {
  const Rephrase({super.key});

  @override
  State<Rephrase> createState() => _RephraseState();
}

class _RephraseState extends State<Rephrase> {
  // bool buttonPressed = false;
  final FocusNode _titleFocusNode = FocusNode();
  bool isloading = false;
  @override
  void initState() {
    super.initState();
    Provider.of<PlagProvider>(context, listen: false).instantiateController();
  }

  int wordCount = 0;
  void updateCharCount(String text) {
    setState(() {
      wordCount = text.length;
    });
  }

  Future<void> _pickFile(List<String> expectedFileType) async {
    setState(() {
      isloading = true;
    });
    await pickFile(
        expectedFileType,
        context,
        Provider.of<PlagProvider>(context, listen: false).controllerTitle!,
        updateCharCount, (bool loading) {
      setState(() {
        isloading = loading;
      });
    });
    setState(() {
      isloading = false;
    });
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
            Strings.plagiarism_rephrase,
          ),
        ),
        body: Consumer<PlagProvider>(
          builder: (context, plagProvider, child) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Positioned(
                    top: 40,
                    left: 25,
                    child: Text(
                      'Rephrase',
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
                        isLoading: isloading,
                      ),
                      Counter(
                          wordCount: plagProvider.controllerTitle!.text.length),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.023,
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.023,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (plagProvider.controllerTitle!.text.isEmpty) {
                            EmptyDialog(context);
                          } else {
                            if (wordCount > 500) {
                              ElebuttonDialog(context);
                            } else {
                              // plagProvider.addItem(
                              //     plagProvider.controllerTitle!.text,
                              //     plagProvider.controllerResult!.text);
                            }
                          }
                        },
                        style: AppDecoration.elevatedbutton,
                        child: Text(
                          'Rephrase',
                          style: Style.eleButtom,
                        ),
                      ),
                      if (plagProvider.items.isNotEmpty &&
                          plagProvider.controllerResult!.text.isNotEmpty)
                        Result(plagProvider.controllerResult!)
                    ],
                  ),
                ],
              ),
            );
          },
        ));
  }
}
