// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';
import '../Localization/LanguageConstants.dart';

class FooterMenu extends StatefulWidget {
  const FooterMenu({super.key});

  @override
  State<FooterMenu> createState() => _FooterMenuState();
}

class _FooterMenuState extends State<FooterMenu> {

  Locale? _locale;
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    return DeviceScreenType.mobile == deviceType
        ? Container(
            width: size.width,
            color: const Color.fromRGBO(240, 243, 245, 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        getTranslated(context, 'ADDRESS')!,
                        Colors.black,
                        18,
                        FontWeight.bold,
                        TextAlign.start,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: TextWidget(
                  //     getTranslated(context, 'ADDRESS_VALUE')!,
                  //     Colors.black,
                  //     16,
                  //     FontWeight.normal,
                  //     TextAlign.start,
                  //   ),
                  // ),
                  TextWidget(
                    //getTranslated(context, 'ADDRESS_VALUE')!,
                    _locale?.languageCode.toString() == "lo"?"ສາຂາ ດົງໂດກ":"Dongdok Branch",
                    Colors.black,
                    16,
                    FontWeight.normal,
                    TextAlign.start,
                  ),
                  TextWidget(
                    //getTranslated(context, 'ADDRESS_VALUE')!,
                    _locale?.languageCode.toString() == "lo"?"ສາຂາ ສະພານທອງ":"Saphanthong Branch",
                    Colors.black,
                    16,
                    FontWeight.normal,
                    TextAlign.start,
                  ),
                  TextWidget(
                    //getTranslated(context, 'ADDRESS_VALUE')!,
                    _locale?.languageCode.toString() == "lo"?"ສາຂາ ແຄມຂອງ":"Mekhong branch",
                    Colors.black,
                    16,
                    FontWeight.normal,
                    TextAlign.start,
                  ),

                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        getTranslated(context, 'CONTACT')!,
                        Colors.black,
                        18,
                        FontWeight.bold,
                        TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.phoneSquare),
                        const SizedBox(width: 10),
                        TextWidget(
                          "020 55 395 558",
                          Colors.black,
                          16,
                          FontWeight.normal,
                          TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.facebookSquare),
                        const SizedBox(width: 10),
                        TextWidget(
                          "The Barber Lao",
                          Colors.black,
                          16,
                          FontWeight.normal,
                          TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(FontAwesomeIcons.whatsappSquare),
                        const SizedBox(width: 10),
                        TextWidget(
                          "020 55 395 558",
                          Colors.black,
                          16,
                          FontWeight.normal,
                          TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Row(
            children: [
              SizedBox(width: size.width * 0.2),
              Container(
                width: size.width * 0.6,
                color: const Color.fromRGBO(240, 243, 245, 1),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        width: size.width * 0.3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/LOGO01.png",
                              width: 200,
                              height: 80,
                            ),
                            Center(
                              child: TextWidget(
                                getTranslated(context, 'SLOGAN')!,
                                Colors.black,
                                14,
                                FontWeight.normal,
                                TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 64),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    //getTranslated(context, 'ADDRESS_VALUE')!,
                                    _locale?.languageCode.toString() == "lo"?"ສາຂາດົງໂດກ":"Dongdok Branch",
                                    Colors.black,
                                    16,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 64),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    //getTranslated(context, 'ADDRESS_VALUE')!,
                                    _locale?.languageCode.toString() == "lo"?"ສາຂາສະພານທອງ":"Saphanthong Branch",
                                    Colors.black,
                                    16,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 64),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    //getTranslated(context, 'ADDRESS_VALUE')!,
                                    _locale?.languageCode.toString() == "lo"?"ສາຂາແຄມຂອງ":"Mekhong branch",
                                    Colors.black,
                                    16,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextWidget(
                                getTranslated(context, 'CONTACT')!,
                                Colors.black,
                                18,
                                FontWeight.bold,
                                TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.phoneSquare),
                              const SizedBox(width: 10),
                              TextWidget(
                                "020 55 395 558",
                                Colors.black,
                                16,
                                FontWeight.normal,
                                TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.facebookSquare),
                              const SizedBox(width: 10),
                              TextWidget(
                                "The Barber Lao",
                                Colors.black,
                                16,
                                FontWeight.normal,
                                TextAlign.center,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FontAwesomeIcons.whatsappSquare),
                              const SizedBox(width: 10),
                              TextWidget(
                                "020 55 395 558",
                                Colors.black,
                                16,
                                FontWeight.normal,
                                TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(height: 55),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.2),
            ],
          );
  }
}
