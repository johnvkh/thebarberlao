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

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

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
                const VideoWidget(),
                const SliderPromotionWidget(),
                const MenuService(),
                const LocationWidget(),
                const BarberWidget(),
                // Padding(
                //   padding: const EdgeInsets.all(10.0),
                //   child: Column(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.all(5.0),
                //         child: TextWidget(
                //           getTranslated(context, 'SERVICE_TBL')!,
                //           Colors.black,
                //           18,
                //           FontWeight.bold,
                //           TextAlign.center,
                //         ),
                //       ),
                //       Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         children: [
                //           const Spacer(),
                //           GestureDetector(
                //             onTap: () async {},
                //             child: Card(
                //               elevation: 3,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5),
                //               ),
                //               child: Column(
                //                 children: [
                //                   Container(
                //                     margin: const EdgeInsets.symmetric(
                //                       horizontal: 10,
                //                       vertical: 10,
                //                     ),
                //                     child: Image.asset(
                //                       "assets/images/man_service.png",
                //                       width: 140,
                //                       height: 120,
                //                       fit: BoxFit.fill,
                //                     ),
                //                   ),
                //                   Center(
                //                     child: TextWidget(
                //                       getTranslated(context, 'SERVICE_MAN')!,
                //                       Colors.black,
                //                       16,
                //                       FontWeight.bold,
                //                       TextAlign.start,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //           const Spacer(),
                //           GestureDetector(
                //             onTap: () async {},
                //             child: Card(
                //               elevation: 3,
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(5),
                //               ),
                //               child: Column(
                //                 children: [
                //                   Container(
                //                     margin: const EdgeInsets.symmetric(
                //                       horizontal: 10,
                //                       vertical: 10,
                //                     ),
                //                     child: Image.asset(
                //                       "assets/images/woman_service.png",
                //                       width: 140,
                //                       height: 120,
                //                       fit: BoxFit.fill,
                //                     ),
                //                   ),
                //                   Center(
                //                     child: TextWidget(
                //                       getTranslated(context, 'SERVICE_WOMAN')!,
                //                       Colors.black,
                //                       16,
                //                       FontWeight.bold,
                //                       TextAlign.start,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ),
                //           const Spacer(),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
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
