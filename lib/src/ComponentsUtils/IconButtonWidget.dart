// ignore_for_file: file_names

import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.press,
    required this.width,
    required this.height,
    required this.widgetIcon,
    required this.color
  });
  final double width, height;
  final VoidCallback press;
  final Widget widgetIcon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: press,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          child: Center(child: widgetIcon),
        ),
      ),
    );
  }
}
