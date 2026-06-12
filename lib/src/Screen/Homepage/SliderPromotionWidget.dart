// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/SliderPromotionController.dart';
import '../../Model/SliderModel.dart';

class SliderPromotionWidget extends StatefulWidget {
  const SliderPromotionWidget({super.key});

  @override
  State<SliderPromotionWidget> createState() => _SliderPromotionWidgetState();
}

class _SliderPromotionWidgetState extends State<SliderPromotionWidget> {

  static const List<SliderModel> _fallbackList = [
    SliderModel(sliderId: "1", sliderURL: "assets/images/slider1.png", sort: "1"),
  ];

  List<SliderModel> listSlider = [];
  int _current = 0;
  bool loadProcessBar = false;
  bool isNotfound = false;

  late final PageController _pageCtrl = PageController();

  @override
  void initState() {
    super.initState();
    loadSliderInfo();
  }

  Future<void> loadSliderInfo() async {
    try {
      final data = await SliderPromotionController().getAllSlider();
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
    // ✅ auto-play ສະເພາະຖ້າມີຫຼາຍກວ່າ 1 slide
    if (listSlider.length > 1) _startAutoPlay();
  }

  void _startAutoPlay() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 5));
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
        if (listSlider.length > 1) _buildIndication(),
      ],
    );
  }

  Widget _buildBanner() {
    // ✅ aspectRatio: 3.5 — ຄືເກົ່າ
    return AspectRatio(
      aspectRatio: 3.5,
      child: PageView.builder(
        controller: _pageCtrl,
        itemCount: listSlider.length,
        onPageChanged: (i) => setState(() => _current = i),
        itemBuilder: (_, i) {
          final url = listSlider[i].sliderURL.toString();
          return isNotfound
              ? Image.asset(url, fit: BoxFit.cover, width: double.infinity)
              : Image.network(
            url,
            fit: BoxFit.fill,
            width: double.infinity,
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