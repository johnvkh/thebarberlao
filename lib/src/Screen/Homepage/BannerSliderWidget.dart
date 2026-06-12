// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/SliderController.dart';
import '../../Model/SliderModel.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {

  // ✅ static const — ບໍ່ສ້າງໃໝ່ທຸກຄັ້ງ
  static const List<SliderModel> _fallbackList = [
    SliderModel(sliderId: "1", sliderURL: "assets/images/slider1.png", sort: "1"),
    SliderModel(sliderId: "2", sliderURL: "assets/images/slider2.png", sort: "2"),
    SliderModel(sliderId: "3", sliderURL: "assets/images/slider3.png", sort: "3"),
    SliderModel(sliderId: "4", sliderURL: "assets/images/slider4.png", sort: "4"),
  ];

  List<SliderModel> listSlider = [];
  int _current = 0;
  bool loadProcessBar = false;
  bool isNotfound = false;

  // ✅ PageController ແທນ CarouselSlider — built-in, ເບົາກວ່າ
  late final PageController _pageCtrl = PageController();

  @override
  void initState() {
    super.initState();
    loadSliderInfo();
  }

  Future<void> loadSliderInfo() async {
    try {
      final data = await SliderController().getAllSlider();
      if (!mounted) return;
      if (data.isNotEmpty) {
        setState(() {
          listSlider = data;
          loadProcessBar = true;
        });
      } else {
        setState(() {
          listSlider = _fallbackList;
          loadProcessBar = true;
          isNotfound = true;
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        listSlider = _fallbackList;
        loadProcessBar = true;
        isNotfound = true;
      });
    }
    // ✅ ເລີ່ມ auto-play ຫຼັງ load ສຳເລັດ
    _startAutoPlay();
  }

  void _startAutoPlay() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 4));
      if (!mounted) return false;
      final next = (_current + 1) % listSlider.length;
      _pageCtrl.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      return true;
    });
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!loadProcessBar) return LoadDialog(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        _buildBanner(),
        _buildIndication(),
      ],
    );
  }

  Widget _buildBanner() {
    return AspectRatio(
      aspectRatio: 2,
      child: PageView.builder(
        controller: _pageCtrl,
        itemCount: listSlider.length,
        onPageChanged: (i) => setState(() => _current = i),
        itemBuilder: (_, i) {
          final url = listSlider[i].sliderURL.toString();
          // ✅ Network ຫຼື Asset ອັດຕະໂນມັດ
          return isNotfound
              ? Image.asset(url, fit: BoxFit.cover, width: double.infinity)
              : Image.network(
            url,
            fit: BoxFit.cover,
            width: double.infinity,
            // ✅ cacheWidth ຫຼຸດ memory
            cacheWidth: MediaQuery.of(context).size.width.toInt() * 2,
            loadingBuilder: (_, child, progress) =>
            progress == null ? child : LoadDialog(context),
            errorBuilder: (_, __, ___) =>
                Image.asset('assets/images/slider1.png', fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  // ✅ Dots indicator — animated pill shape
  Widget _buildIndication() {
    return Positioned(
      bottom: 16,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(listSlider.length, (i) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: _current == i ? 20 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: _current == i
                  ? Colors.white
                  : Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }),
      ),
    );
  }
}