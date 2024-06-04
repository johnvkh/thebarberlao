import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Screen/Footer.dart';
import 'package:thebarberlao/src/Screen/FooterMenu.dart';

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
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SizedBox(height: 50),
              Image.asset("assets/images/hero3.jpg"),
              Container(
                width: size.width,
                color: Color.fromRGBO(44, 44, 44, 1),
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
              FooterMenu(),
              Footer(),
            ],
          ),
        ),
        Header(scrollController: _scrollController),
      ]),
    );
  }
}
