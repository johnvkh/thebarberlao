// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Screen/Footer.dart';
import 'package:thebarberlao/src/Screen/FooterMenu.dart';
import 'package:thebarberlao/src/Utility/Constants.dart';

import '../../Utility/WidgetUtility.dart';
import '../Header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset("assets/images/hero3.jpg",),
              Container(
                width: size.width,
                color: const Color.fromRGBO(240, 243, 245, 1),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        "ທ່ານປອດໄພເມື່ອຢູ່ກັບເຮົາ",
                        Colors.black,
                        16,
                        FontWeight.bold,
                        TextAlign.center,
                      ),
                      SizedBox(
                        width: size.width,
                        child: TextWidget(
                          "ພວກເຮົາປົກປ້ອງຕົນເອງແລະ coustomer ຂອງພວກເຮົາໂດຍການຮູ້ຂໍ້ເທັດຈິງແລະການລະມັດລະວັງທີ່ເຫມາະສົມ.",
                          Colors.black,
                          14,
                          FontWeight.normal,
                          TextAlign.start,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/safe-logo1.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextWidget(
                                  "ນ້ຳຢາຂ້າເຊື້ອລ້າງມື",
                                  safeTextColor,
                                  14,
                                  FontWeight.bold,
                                  TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  width: 220,
                                  child: TextWidget(
                                    "ລ້າງມືເປັນເວລາ 20 ວິນາທີດ້ວຍນ້ຳອຸ່ນໃຊ້ໄດ້ດີທີ່ສຸດ.",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/safe-logo2.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextWidget(
                                  "ໃສ່ໜ້າກາກປ້ອງກັນ",
                                  safeTextColor,
                                  14,
                                  FontWeight.bold,
                                  TextAlign.start,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  width: 220,
                                  child: TextWidget(
                                    "ຊຸດປ້ອງກັນທີ່ອອກແບບມາເພື່ອປົກປ້ອງໃບໜ້າ ແລະຕາຂອງຜູ້ໃສ່ ແລະ ປ້ອງກັນການເກີດໄອຈາມ",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/images/safe-logo3.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  width: 220,
                                  child: TextWidget(
                                    "ອະນາໄມອຸປະກອນ, ຂ້າເຊື້ອຢ່າງສະໝ່ຳສະເໝີ",
                                    safeTextColor,
                                    14,
                                    FontWeight.bold,
                                    TextAlign.start,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SizedBox(
                                  width: 220,
                                  child: TextWidget(
                                    "ການອະນາໄມ ແລະ ຂ້າເຊື້ອອຸປະກອນຕ່າງໆ, ໂດຍສະເພາະສິ່ງທີ່ຖືກສໍາຜັດເລື້ອຍໆ.",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                color: const Color.fromRGBO(44, 44, 44, 1),
                child: Column(
                  children: [
                    TextWidget(
                      "ບໍລີການ",
                      Colors.white,
                      14,
                      FontWeight.normal,
                      TextAlign.center,
                    ),
                    TextWidget(
                      "ບໍລີການຊ່າງຊາຍ",
                      Colors.white,
                      14,
                      FontWeight.normal,
                      TextAlign.center,
                    ),
                    TextWidget(
                      "ບໍລີການຊ່າງຍິງ",
                      Colors.white,
                      14,
                      FontWeight.normal,
                      TextAlign.center,
                    ),
                  ],
                ),
              ),
              // const BannerSlider(),
              // SizedBox(height: 15),
              // MainMenu(),
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   height: 1500,
              //   width: double.infinity,
              //   color: Colors.red,
              //   child: Text("xxxxxxxxxxx"),
              // ),
              const FooterMenu(),
              const Footer(),
            ],
          ),
        ),
        Header(scrollController: _scrollController),
      ]),
    );
  }
}
