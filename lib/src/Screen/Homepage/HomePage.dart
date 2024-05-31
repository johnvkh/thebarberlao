import 'package:flutter/material.dart';

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
              const BannerSlider(),
              SizedBox(height: 15),
              MainMenu(),
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 1500,
                width: double.infinity,
                color: Colors.red,
                child: Text("xxxxxxxxxxx"),
              ),
            ],
          ),
        ),
        HeaderWidget(scrollController: _scrollController),
      ]),
    );
  }
}
