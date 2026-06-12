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
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ResponsiveBuilder(
          builder: (context, sizing) {
            return sizing.deviceScreenType == DeviceScreenType.mobile
                ? _buildMobile()
                : _buildDesktop();
          },
        ),
      ),
    );
  }

  // ✅ ໃຊ້ const list ເກັບໄວ້ — ບໍ່ rebuild ທຸກຄັ້ງ
  static const List<Widget> _sections = [
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
  ];

  Widget _buildMobile() {
    return CustomScrollView(
      // ✅ physics ທີ່ smooth ໃນ web
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          // ✅ toolbarHeight ກຳນົດຊັດ — ບໍ່ให้ AppBar resize
          toolbarHeight: 64,
          flexibleSpace: Header(
            isShow: true,
            scrollController: _scrollController,
          ),
        ),
        // ✅ SliverList.list ດີກວ່າ SliverChildListDelegate
        SliverList.list(children: _sections),
      ],
    );
  }

  Widget _buildDesktop() {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        // ✅ Desktop ກໍໃຊ້ SliverAppBar — scroll ບໍ່ jarring
        SliverAppBar(
          pinned: true,
          backgroundColor: Colors.white,
          toolbarHeight: 64,
          flexibleSpace: Header(
            isShow: true,
            scrollController: _scrollController,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 120),
          sliver: SliverList.list(children: _sections),
        ),
      ],
    );
  }
}