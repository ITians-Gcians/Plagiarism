import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/desc_widget.dart';
import '../theme/app_decoration.dart';
import '../theme/style.dart';
import '../utils/images.dart';

class TextFieldContainer extends StatefulWidget {
  @override
  State<TextFieldContainer> createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  final _corntrollerTitle = TextEditingController();
  final _corntrollerEmail = TextEditingController();

  @override
  void initState() {
    super.initState();
    _corntrollerTitle.text = '';
    _corntrollerEmail.text = '';
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Flexible(
      child: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        decoration: BoxDecoration(color: Color(0x7FD9D9D9)),
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 150.0),
              child:
                  Text('Please fill all the fields**', style: Style.fillField),
            ),
            SizedBox(
              height: deviceSize.height * 0.013,
            ),
            Container(
              width: deviceSize.width * 0.86,
              height: deviceSize.height * 0.47,
              decoration: AppDecoration.fieldcontainer,
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(width: deviceSize.width * 0.08),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(Images.person),
                          ),
                          SizedBox(width: deviceSize.width * 0.025),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: deviceSize.height * 0.03,
                              width: deviceSize.width * 0.003,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          SizedBox(width: deviceSize.width * 0.025),
                          SizedBox(
                            height: deviceSize.height * 0.055,
                            width: deviceSize.width * 0.55,
                            child: TextField(
                              decoration: AppDecoration.your_name,
                              controller: _corntrollerTitle,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: deviceSize.width * 0.08,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(Images.email),
                          ),
                          SizedBox(width: deviceSize.width * 0.03),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Container(
                              height: deviceSize.height * 0.03,
                              width: deviceSize.width * 0.003,
                              color: Colors.black.withOpacity(0.2),
                            ),
                          ),
                          SizedBox(width: deviceSize.width * 0.026),
                          SizedBox(
                            height: deviceSize.height * 0.055,
                            width: deviceSize.width * 0.55,
                            child: TextField(
                              decoration: AppDecoration.email,
                              controller: _corntrollerEmail,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Divider(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Description(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
