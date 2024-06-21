// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Utility/WidgetUtility.dart';

class GroupService extends StatefulWidget {
  const GroupService({super.key});

  @override
  State<GroupService> createState() => _GroupServiceState();
}

class _GroupServiceState extends State<GroupService>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);
  final _tabs = [
    const Tab(text: 'Tab1'),
    const Tab(text: 'Tab2'),
    const Tab(text: 'Tab3'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            color: const Color.fromRGBO(44, 44, 44, 1),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: getTranslated(context, 'SERVICE_MAN')!,
                      ),
                      Tab(
                        text: getTranslated(context, 'SERVICE_WOMAN')!,
                      ),
                      Tab(
                        text: getTranslated(context, 'ADDITIONAL_SERVICE')!,
                      ),
                    ],
                    labelStyle: const TextStyle(fontFamily: "roboto",fontSize: 13),
                    controller: _tabController,
                    indicatorColor: Colors.white,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          width: size.width,
          height: size.height * 0.38,
          // height: 341,
          child: TabBarView(
            controller: _tabController,
            children: [
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/ManService.jpeg",
                          fit: BoxFit.cover,
                          width: size.width * 0.9,
                          height: size.height * 0.3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextWidget(
                          getTranslated(context, 'SLOGAN')!,
                          Colors.black,
                          14,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          "assets/images/FemaleService.jpg",
                          fit: BoxFit.cover,
                          width: size.width * 0.9,
                          height: size.height * 0.3,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextWidget(
                          getTranslated(context, 'SLOGAN')!,
                          Colors.black,
                          14,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/FemaleService.jpg",
                              fit: BoxFit.cover,
                              width: 190,
                              height: 130,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/FemaleService.jpg",
                              fit: BoxFit.cover,
                              width: 190,
                              height: 130,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/FemaleService.jpg",
                              fit: BoxFit.cover,
                              width: 190,
                              height: 130,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              "assets/images/FemaleService.jpg",
                              fit: BoxFit.cover,
                              width: 190,
                              height: 130,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: TextWidget(
                          getTranslated(context, 'SLOGAN')!,
                          Colors.black,
                          14,
                          FontWeight.bold,
                          TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
