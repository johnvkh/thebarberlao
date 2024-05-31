// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

import '../Utility/WidgetUtility.dart';

class PanelWiget extends StatelessWidget {
  const PanelWiget({
    super.key,
    required this.txtValue,
    required this.childWidget,
    required this.childTopPanelWidget,
    required this.isShowChildTopPanel, required this.icon,
  });

  final String txtValue;
  final Widget childWidget;
  final Icon icon;
  final Widget childTopPanelWidget;
  final bool isShowChildTopPanel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
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
              if (isShowChildTopPanel) childTopPanelWidget,
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
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
    );
  }
}
