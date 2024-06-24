// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';

import '../Footer.dart';
import '../FooterMenu.dart';
import '../Header.dart';

class MaleServicePage extends StatefulWidget {
  const MaleServicePage({super.key});

  @override
  State<MaleServicePage> createState() => _MaleServicePageState();
}

class _MaleServicePageState extends State<MaleServicePage> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: DeviceScreenType.mobile == deviceType
            ? Stack(children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: size.width * 0.4,
                                  height: size.height * 0.3,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(240, 243, 245, 1),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/MaleService/Cut.jpg",
                                        fit: BoxFit.cover,
                                        width: size.width * 0.4,
                                        height: size.height * 0.2,
                                      ),
                                      TextWidget(
                                        "ຕັດຜົມ",
                                        Colors.black,
                                        14,
                                        FontWeight.normal,
                                        TextAlign.center,
                                      ),
                                      TextWidget(
                                        "80.000 ກີບ",
                                        Colors.black,
                                        14,
                                        FontWeight.normal,
                                        TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Container(
                                  width: size.width * 0.4,
                                  height: size.height * 0.3,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/MaleService/CutStyling.jpg",
                                        fit: BoxFit.cover,
                                        width: size.width * 0.4,
                                        height: size.height * 0.2,
                                      ),
                                      TextWidget(
                                        "ຕັດ-ຈັດຊົງ",
                                        Colors.black,
                                        14,
                                        FontWeight.normal,
                                        TextAlign.center,
                                      ),
                                      TextWidget(
                                        "80.000 ກີບ",
                                        Colors.black,
                                        14,
                                        FontWeight.normal,
                                        TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const FooterMenu(),
                      const Footer(),
                    ],
                  ),
                ),
                Header(
                  scrollController: _scrollController,
                  isShow: false,
                ),
              ])
            : Stack(children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.3,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(240, 243, 245, 1),
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/MaleService/Cut.jpg",
                                              fit: BoxFit.cover,
                                              width: size.width * 0.25,
                                              height: size.height * 0.2,
                                            ),
                                            const SizedBox(height: 10),
                                            TextWidget(
                                              "ຕັດຜົມ",
                                              Colors.black,
                                              14,
                                              FontWeight.normal,
                                              TextAlign.center,
                                            ),
                                            const SizedBox(height: 10),
                                            TextWidget(
                                              "80.000 ກີບ",
                                              Colors.black,
                                              14,
                                              FontWeight.normal,
                                              TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Container(
                                        width: size.width * 0.25,
                                        height: size.height * 0.3,
                                        decoration: const BoxDecoration(
                                          color:
                                          Color.fromRGBO(240, 243, 245, 1),
                                        ),
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              "assets/images/MaleService/CutStyling.jpg",
                                              fit: BoxFit.cover,
                                              width: size.width * 0.25,
                                              height: size.height * 0.2,
                                            ),
                                            const SizedBox(height: 10),
                                            TextWidget(
                                              "ຕັດ-ຈັດຊົງ",
                                              Colors.black,
                                              14,
                                              FontWeight.normal,
                                              TextAlign.center,
                                            ),
                                            const SizedBox(height: 10),
                                            TextWidget(
                                              "80.000 ກີບ",
                                              Colors.black,
                                              14,
                                              FontWeight.normal,
                                              TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      const FooterMenu(),
                      const Footer(),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: size.width * 0.2),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Header(
                        scrollController: _scrollController,
                        isShow: true,
                      ),
                    ),
                    SizedBox(width: size.width * 0.2),
                  ],
                ),
              ]),
      ),
    );
  }
}
