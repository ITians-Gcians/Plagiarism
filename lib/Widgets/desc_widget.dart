import 'package:flutter/material.dart';

import '../theme/app_decoration.dart';
import '../theme/style.dart';

class Description extends StatelessWidget {
  final _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: deviceSize.width * 0.72,
          height: deviceSize.height * 0.17,
          padding: EdgeInsets.only(left: 10, right: 10),
          decoration: ShapeDecoration(
            color: Color(0x82D9D9D9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: TextField(
            textAlign: TextAlign.start,
            maxLines: 4,
            decoration: AppDecoration.descr,
            controller: _descController,
          ),
        ),
        SizedBox(
          height: deviceSize.height * 0.025,
        ),
        SizedBox(
          width: deviceSize.width * 0.42,
          height: deviceSize.height * 0.045,
          child: ElevatedButton(
            onPressed: () {},
            style: AppDecoration.elevatedbutton,
            child: Text(
              'Send',
              style: Style.eleButtom,
            ),
          ),
        ),
      ],
    );
  }
}
