// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Utility/Constants.dart';
import '../Utility/WidgetUtility.dart';

class PanelCloseWiget extends StatelessWidget {
  const PanelCloseWiget({
    super.key,
    required this.txtValue,
    required this.childWidget,
    required this.widthValue, required this.heightValue, required this.icon,
  });

  final String txtValue;
  final Widget childWidget;
  final double widthValue;
  final double heightValue;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            width: widthValue,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(1),
                topLeft: Radius.circular(1),
              ),
              border: Border.all(
                  color: const Color.fromRGBO(146, 98, 87, 0.1), width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: icon,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextWidget(
                    txtValue,
                    Colors.black45,
                    16,
                    FontWeight.bold,
                    TextAlign.start,
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close_sharp,
                    color: colorTextTable,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: widthValue,
            height: heightValue,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(255, 255, 255, 1),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(1),
                bottomRight: Radius.circular(1),
              ),
              border: Border.all(
                color: const Color.fromRGBO(146, 98, 87, 0.1),
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: childWidget,
            ),
          ),
        ],
      ),
    );
  }
}
