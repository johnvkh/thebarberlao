// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

Widget TextWidget(
  String content,
  Color color,
  double fontSize,
  FontWeight fontWeight,
  TextAlign textAlign,
) {
  return Text(
    content,
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: 'roboto',
    ),
    textAlign: textAlign,
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
  );
}

Widget TextButtonWidget(
  VoidCallback onPass,
  String content,
  Color color,
  double fontSize,
  FontWeight fontWeight,
) {
  return TextButton(
    onPressed: onPass,
    child: Text(
      content,
      style: TextStyle(
        fontFamily: 'roboto',
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    ),
  );
}

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      height: 38.0,
    );
  }
}

Widget DividerWidget() {
  return const Divider(
    color: Colors.black,
    height: 20,
    thickness: 1,
    indent: 1,
    endIndent: 1,
  );
}
