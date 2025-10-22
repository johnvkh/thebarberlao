import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../Footer.dart';
import '../FooterMenu.dart';
import 'BannerSliderWidget.dart';
import 'VideoWidget.dart';
import 'VideoSalonWidget.dart';
import 'SliderPromotionWidget.dart';
import 'GroupService.dart';
import 'BarberWidget.dart';
import 'MenuService.dart';
import 'LocationWidget.dart';
import '../Header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  void dispose() {
    _scrollController.dispose(); // อย่าลืมปิด
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveBuilder(
          builder: (context, sizing) {
            if (sizing.deviceScreenType == DeviceScreenType.mobile) {
              return _buildMobile();
            } else {
              return _buildDesktop(context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildMobile() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          flexibleSpace: Header(isShow: true,scrollController: _scrollController,),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            const BannerSlider(),
            const VideoWidget(),
            const VideoSalonWidget(),
            const SliderPromotionWidget(),
            const GroupService(),
            const BarberWidget(),
            const MenuService(),
            const LocationWidget(),
            const FooterMenu(),
            const Footer(),
          ]),
        ),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Header(isShow: true,scrollController: _scrollController),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 120),
            child: Column(
              children: [
                BannerSlider(),
                VideoWidget(),
                VideoSalonWidget(),
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
        ],
      ),
    );
  }
}
