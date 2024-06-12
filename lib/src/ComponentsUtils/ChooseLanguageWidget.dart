// ignore_for_file: file_names, use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';

import '../Localization/LanguageConstants.dart';
import '../Model/LanguageModel.dart';
import '../myApp.dart';

class ChooseLanguageWidget extends StatefulWidget {
  const ChooseLanguageWidget({super.key, required this.color});
  final Color color;

  @override
  State<ChooseLanguageWidget> createState() => _ChooseLanguageWidgetState();
}

class _ChooseLanguageWidgetState extends State<ChooseLanguageWidget> {
  bool isHoveredLanguage = false;
  String languageCode = "ພາສາລາວ";

  void _changeLanguage(LanguageModel language) async {
    Locale locale = await setLocale(language.languageCode!);
    MyApp.setLocale(context, locale);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        onEnteredLanguage(true);
      },
      onExit: (event) {
        onEnteredLanguage(false);
      },
      cursor: SystemMouseCursors.click,
      child: PopupMenuButton(
        color: Colors.black,
        child: Icon(
          Icons.language,
          //color: Colors.black45,
          color: widget.color,
          size: 28,
        ),
        itemBuilder: (context) => <PopupMenuEntry>[
          ...LanguageModel.languageList().map(
            (index) => PopupMenuItem(
              onTap: () {
                _changeLanguage(index);
                setState(() {
                  languageCode = index.name!;
                });
              },
              value: index,
              //child: Text(index.name!,style: const TextStyle(fontFamily: 'roboto'),),
              child: Row(
                children: [
                  Image.asset(index.image.toString(),width: 30,height: 15,),
                  Text(index.name!,style: const TextStyle(fontFamily: 'roboto',color: Colors.white),),
                ],
              ),
            ),
          ),
        ].toList(),
      ),
    );
  }

  void onEnteredLanguage(bool isHoveredLanguage) {
    setState(() {
      this.isHoveredLanguage = isHoveredLanguage;
    });
  }
}
