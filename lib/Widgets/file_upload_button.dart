import 'package:flutter/material.dart';

import '../utils/images.dart';

class FileUploadButton extends StatelessWidget {
  final Function onPressed;

  const FileUploadButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Row(
      children: [
        SizedBox(
          width: deviceSize.width * 0.73,
        ),
        TextButton(
          onPressed: () async {
            onPressed();
          },
          child: Column(
            children: [
              Image.asset(Images.upload),
              SizedBox(
                height: deviceSize.height * 0.003,
              ),
              Text(
                'Upload File',
                style: TextStyle(color: Colors.black, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
