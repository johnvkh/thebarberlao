// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TextHoverWidget extends StatefulWidget {
  const TextHoverWidget({
    super.key,
    required this.content,
    required this.color1,
    required this.color2,
    required this.fontSize,
    required this.fontWeight,
  });
  final String content;
  final Color color1;
  final Color color2;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  State<TextHoverWidget> createState() => _TextHoverWidgetState();
}

class _TextHoverWidgetState extends State<TextHoverWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        onEntered(true);
      },
      onExit: (event) {
        onEntered(false);
      },
      cursor: SystemMouseCursors.click,
      child: Text(
        widget.content,
        style: TextStyle(
          fontFamily: 'roboto',
          color: isHovered == false ? widget.color1 : widget.color2,
          fontSize: widget.fontSize,
          fontWeight: widget.fontWeight,
        ),
        maxLines: 2,
      ),
    );
  }

  void onEntered(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
  }
}
