// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Screen/Footer.dart';
import 'package:thebarberlao/src/Screen/FooterMenu.dart';
import 'package:thebarberlao/src/Screen/Homepage/BannerSliderWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/GroupService.dart';
import 'package:thebarberlao/src/Screen/Homepage/LocationWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/MenuService.dart';
import 'package:thebarberlao/src/Screen/Homepage/SliderPromotionWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/VideoSalonWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/VideoWidget.dart';
import '../Header.dart';
import 'BarberWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(240, 231, 230, 1),
        body: DeviceScreenType.mobile == deviceType
            ? Stack(children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: const Column(
                    children: [
                      SizedBox(height: 50),
                      BannerSlider(),
                      VideoWidget(),
                      VideoSalonWidget(),
                      SliderPromotionWidget(),
                      GroupService(),
                      Divider(color: Colors.grey),
                      BarberWidget(),
                      Divider(color: Colors.grey),
                      MenuService(),
                      Divider(color: Colors.grey),
                      LocationWidget(),
                      Divider(color: Colors.grey),
                      FooterMenu(),
                      Footer(),
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
                            height: size.height * 0.5,
                            child: const BannerSlider(),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const VideoWidget(),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const VideoSalonWidget(),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const SliderPromotionWidget(),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const Divider(color: Colors.grey,height: 1,),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      const GroupService(),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const Divider(color: Colors.grey),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const BarberWidget(),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const Divider(color: Colors.grey),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const MenuService(),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const Divider(color: Colors.grey),
                          ),
                          SizedBox(width: size.width * 0.2),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.2),
                          SizedBox(
                            width: size.width * 0.6,
                            child: const LocationWidget(),
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
                        isShow: false,
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
