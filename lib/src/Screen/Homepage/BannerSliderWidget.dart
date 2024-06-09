import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        BannerSection(),
      ],
    );
  }
}

class BannerSection extends StatefulWidget {
  @override
  State<BannerSection> createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final List<String> _imageList = [
    'assets/images/slider1.png',
    'assets/images/slider2.png',
    'assets/images/slider3.png',
    'assets/images/slider4.png',
  ];

  int? _current;

  @override
  void initState() {
    _current = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBanner(),
        _buildIndication(),
      ],
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      // margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
          // aspectRatio: 1.873,
          aspectRatio: 2,
          viewportFraction: 1.0,
          autoPlay: true,
          onPageChanged: (index, reason) {
            print("$index");
            setState(() {
              _current = index;
            });
          },
        ),
        items: _imageList
            .map(
              (item) => Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
            .toList(),
      ),
    );
  }

  _buildIndication() => Positioned(
        bottom: 20,
        left: MediaQuery.of(context).size.width/2-20,
        child: Row(
          children: _imageList.map((url) {
            int index = _imageList.indexOf(url);
            return Container(
              width: 8,
              height: _current == index ? 8 : 1,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                shape: _current == index ? BoxShape.circle : BoxShape.rectangle,
                color: Colors.transparent,
              ),
            );
          }).toList(),
        ),
      );
}
