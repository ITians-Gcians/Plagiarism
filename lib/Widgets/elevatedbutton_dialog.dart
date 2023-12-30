import 'package:flutter/material.dart';

import '../theme/style.dart';

void ElebuttonDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'Error',
            style: Style.dialogTitle,
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            'Please Enter the Characters below than 500.',
            style: Style.dialogtext,
          ),
        ),
        actions: [
          Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )))
        ],
      );
    },
  );
}
