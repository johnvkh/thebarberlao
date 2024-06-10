// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/ComponentsUtils/IconButtonWidget.dart';
import 'package:thebarberlao/src/Screen/Footer.dart';
import 'package:thebarberlao/src/Screen/FooterMenu.dart';
import 'package:thebarberlao/src/Screen/Homepage/BannerSliderWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/LocationWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/MenuService.dart';
import 'package:thebarberlao/src/Utility/Constants.dart';
import 'package:video_player/video_player.dart';

import '../../Utility/WidgetUtility.dart';
import '../Header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      'assets/images/Onlylove.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    //_controller.play();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: 50),
                const BannerSlider(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        _controller.play();
                      }
                    });
                  },
                  child: FutureBuilder(
                    future: _initializeVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const MenuService(),
                const LocationWidget(),
                Container(
                  height: 590,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () async {},
                        child: Card(
                          elevation: 3,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Hero(
                                  tag: "Test1",
                                  child: Image.asset(
                                    "assets/images/hero3.jpg",
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      left: 15, bottom: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextWidget(
                                        "The Barber Lao ສາຂາ ດົງໂດກ",
                                        Colors.black,
                                        18,
                                        FontWeight.bold,
                                        TextAlign.start,
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.locationDot,
                                            color: kSecondaryColor
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          TextWidget(
                                            "ບ້ານ ດົງໂດກ, ເມືອງ ໄຊເສດຖາ, ນະຄອນ\nຫຼວງວຽງຈັນ",
                                            Colors.black,
                                            14,
                                            FontWeight.normal,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.phone,
                                            color: kSecondaryColor
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          TextWidget(
                                            "020 90 845 155",
                                            Colors.black,
                                            14,
                                            FontWeight.normal,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      GestureDetector(
                                        onTap: () async {},
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.map,
                                              color: kSecondaryColor
                                                  .withOpacity(1),
                                              size: 18,
                                            ),
                                            const SizedBox(width: 10),
                                            TextWidget(
                                              "open map",
                                              Colors.black,
                                              14,
                                              FontWeight.bold,
                                              TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {},
                        child: Card(
                          elevation: 3,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Hero(
                                  tag: "Test2",
                                  child: Image.asset(
                                    "assets/images/hero3.jpg",
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      left: 15, bottom: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextWidget(
                                        "The Barber Lao ສາຂາ ສະພານທອງ",
                                        Colors.black,
                                        18,
                                        FontWeight.bold,
                                        TextAlign.start,
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.locationDot,
                                            color: kSecondaryColor
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          TextWidget(
                                            "ບ້ານ ສະພານທອງ, ເມືອງ ໄຊເສດຖາ, ນະຄອນ\nຫຼວງວຽງຈັນ",
                                            Colors.black,
                                            14,
                                            FontWeight.normal,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.phone,
                                            color: kSecondaryColor
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          TextWidget(
                                            "020 90 845 155",
                                            Colors.black,
                                            14,
                                            FontWeight.normal,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      GestureDetector(
                                        onTap: () async {},
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.map,
                                              color: kSecondaryColor
                                                  .withOpacity(1),
                                              size: 18,
                                            ),
                                            const SizedBox(width: 10),
                                            TextWidget(
                                              "open map",
                                              Colors.black,
                                              14,
                                              FontWeight.bold,
                                              TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () async {},
                        child: Card(
                          elevation: 3,
                          // color: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 10,
                                ),
                                child: Hero(
                                  tag: "Test3",
                                  child: Image.asset(
                                    "assets/images/hero3.jpg",
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                    left: 15,
                                    bottom: 10,
                                    right: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextWidget(
                                        "The Barber Lao ສາຂາແຄມຂອງ",
                                        Colors.black,
                                        18,
                                        FontWeight.bold,
                                        TextAlign.start,
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.locationDot,
                                            color: kSecondaryColor
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          TextWidget(
                                            "ບ້ານ ສະພານທອງ, ເມືອງ ໄຊເສດຖາ, ນະຄອນ\nຫຼວງວຽງຈັນ",
                                            Colors.black,
                                            14,
                                            FontWeight.normal,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            FontAwesomeIcons.phone,
                                            color: kSecondaryColor
                                                .withOpacity(0.5),
                                            size: 18,
                                          ),
                                          const SizedBox(width: 10),
                                          TextWidget(
                                            "020 90 845 155",
                                            Colors.black,
                                            14,
                                            FontWeight.normal,
                                            TextAlign.start,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      GestureDetector(
                                        onTap: () async {},
                                        child: Row(
                                          children: [
                                            Icon(
                                              FontAwesomeIcons.map,
                                              color: kSecondaryColor
                                                  .withOpacity(1),
                                              size: 18,
                                            ),
                                            const SizedBox(width: 10),
                                            TextWidget(
                                              "open map",
                                              Colors.black,
                                              14,
                                              FontWeight.bold,
                                              TextAlign.start,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const FooterMenu(),
                const Footer(),
              ],
            ),
          ),
          Header(scrollController: _scrollController),
        ]),
      ),
    );
  }
}
