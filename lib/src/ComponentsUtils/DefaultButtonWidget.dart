// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../Utility/Constants.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    super.key,
    required this.press,
    required this.textValue,
    required this.color,
    required this.width,
    required this.height,
  });
  final VoidCallback press;
  final String textValue;
  final Color color;
  final double width, height;

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
            boxShadow: [
              BoxShadow(
                color: kPrimaryColor.withOpacity(0.2),
                spreadRadius: 4,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              textValue,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                fontFamily: 'roboto',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
