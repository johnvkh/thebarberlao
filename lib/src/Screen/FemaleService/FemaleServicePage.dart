// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Footer.dart';
import '../FooterMenu.dart';
import '../Header.dart';

class FemaleServicePage extends StatefulWidget {
  const FemaleServicePage({super.key});

  @override
  State<FemaleServicePage> createState() => _FemaleServicePageState();
}

class _FemaleServicePageState extends State<FemaleServicePage> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: const Column(
                children: [
                  SizedBox(height: 50),
                  FooterMenu(),
                  Footer(),
                ],
              ),
            ),
            Header(scrollController: _scrollController,isShow: true,),
          ],
        ),
      ),
    );
  }
}
