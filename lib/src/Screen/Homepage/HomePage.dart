// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/ComponentsUtils/IconButtonWidget.dart';
import 'package:thebarberlao/src/Screen/Footer.dart';
import 'package:thebarberlao/src/Screen/FooterMenu.dart';
import 'package:thebarberlao/src/Screen/Homepage/BannerSliderWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/GroupService.dart';
import 'package:thebarberlao/src/Screen/Homepage/LocationWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/MenuService.dart';
import 'package:thebarberlao/src/Screen/Homepage/SliderPromotionWidget.dart';
import 'package:thebarberlao/src/Screen/Homepage/VideoWidget.dart';
import 'package:thebarberlao/src/Utility/Constants.dart';
import 'package:video_player/video_player.dart';

import '../../Localization/LanguageConstants.dart';
import '../../Utility/WidgetUtility.dart';
import '../Header.dart';
import 'BarberWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
     {
  final _scrollController = TrackingScrollController();



  final _selectedColor = const Color(0xff1a73e8);
  final _unselectedColor = const Color(0xff5f6368);



  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: const Column(
              children: [
                SizedBox(height: 50),
                BannerSlider(),
                VideoWidget(),
                SliderPromotionWidget(),
                GroupService(),
                BarberWidget(),
                MenuService(),
                LocationWidget(),
                FooterMenu(),
                Footer(),
              ],
            ),
          ),
          Header(scrollController: _scrollController),
        ]),
      ),
    );
  }
}
