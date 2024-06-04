import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/ComponentsUtils/TextHoverWidget.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';

import '../Utility/Constants.dart';

class FooterMenu extends StatefulWidget {
  const FooterMenu({super.key});

  @override
  State<FooterMenu> createState() => _FooterMenuState();
}

class _FooterMenuState extends State<FooterMenu> {
  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    double fontSize = 15;
    return Container(
      width: size.width,
      color: const Color.fromRGBO(240, 243, 245, 1),
      child: DeviceScreenType.desktop == deviceType
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/LOGO01.png",
                        width: 200,
                        height: 80,
                      ),
                      TextWidget(
                        "The Barber Lao ໃຫ້ທ່ານຫລາຍກວ່າຄຳວ່າ 'ຕັດຜົມ'",
                        Colors.black,
                        14,
                        FontWeight.normal,
                        TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      TextWidget(
                        "ປະຈຸບັນຮ້ານເຮົາມີ 3 ສາຂາຄື: ສາຂາດົງໂດກ, ສາຂາສະພານທອງ \nແລະ ສາຂາແຄມຂອງ, Vientiane, Laos",
                        Colors.black,
                        16,
                        FontWeight.normal,
                        TextAlign.center,
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            "The Barber Lao",
                            Colors.black,
                            18,
                            FontWeight.bold,
                            TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextHoverWidget(
                          content: "ໜ້າຫຼັກ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextHoverWidget(
                          content: "ບໍລິການ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextHoverWidget(
                          content: "ຊ່າງຕັດຜົມ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextHoverWidget(
                          content: "ຮູບພາບ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: TextHoverWidget(
                          content: "ກ່ຽວກັບເຮົາ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            "ຂໍ້ມູນຕິດຕໍ່",
                            Colors.black,
                            18,
                            FontWeight.bold,
                            TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.phoneSquare),
                          SizedBox(width: 10),
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
                          Icon(FontAwesomeIcons.facebookSquare),
                          SizedBox(width: 10),
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
                          Icon(FontAwesomeIcons.whatsappSquare),
                          SizedBox(width: 10),
                          TextWidget(
                            "020 55 395 558",
                            Colors.black,
                            16,
                            FontWeight.normal,
                            TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: 55),
                    ],
                  ),

                  Expanded(child: SizedBox()),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/LOGO01.png",
                    width: 200,
                    height: 80,
                  ),
                  TextWidget(
                    "The Barber Lao ໃຫ້ທ່ານຫລາຍກວ່າຄຳວ່າ 'ຕັດຜົມ'",
                    Colors.black,
                    14,
                    FontWeight.normal,
                    TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  TextWidget(
                    "ປະຈຸບັນຮ້ານເຮົາມີ 3 ສາຂາຄື: ສາຂາດົງໂດກ, ສາຂາສະພານທອງ \nແລະ ສາຂາແຄມຂອງ, Vientiane, Laos",
                    Colors.black,
                    16,
                    FontWeight.normal,
                    TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextWidget(
                            "The Barber Lao",
                            Colors.black,
                            18,
                            FontWeight.bold,
                            TextAlign.center,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextHoverWidget(
                          content: "ໜ້າຫຼັກ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                        child: TextHoverWidget(
                          content: "ບໍລິການ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                        child: TextHoverWidget(
                          content: "ຊ່າງຕັດຜົມ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                        child: TextHoverWidget(
                          content: "ຮູບພາບ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                        child: TextHoverWidget(
                          content: "ກ່ຽວກັບເຮົາ",
                          color1: Colors.black,
                          color2: holderColor,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        "ຂໍ້ມູນຕິດຕໍ່",
                        Colors.black,
                        18,
                        FontWeight.bold,
                        TextAlign.center,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.phoneSquare),
                        SizedBox(width: 10),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.facebookSquare),
                        SizedBox(width: 10),
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
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(FontAwesomeIcons.whatsappSquare),
                        SizedBox(width: 10),
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
    );
  }
}
