import 'package:flutter/material.dart';

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
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              Image.asset("assets/images/hero3.jpg"),
              // const BannerSlider(),
              // SizedBox(height: 15),
              // MainMenu(),

            ],
          ),
        ),
        Header(scrollController: _scrollController),
      ]),
    );
  }
}
