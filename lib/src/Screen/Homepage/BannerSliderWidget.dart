// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
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
  final List<SliderModel> _imageList = [
    SliderModel(
        sliderId: "1", sliderURL: "'assets/images/slider1.png'", sort: "1"),
    SliderModel(
        sliderId: "2", sliderURL: "'assets/images/slider2.png'", sort: "2"),
    SliderModel(
        sliderId: "3", sliderURL: "'assets/images/slider3.png'", sort: "3"),
    SliderModel(
        sliderId: "4", sliderURL: "'assets/images/slider4.png'", sort: "4"),
  ];
  SliderModel sliderModel = SliderModel();
  List<SliderModel> listSlider = [];
  int? _current;
  bool loadProcessBar = false;
  bool isNotfound = false;

  @override
  void initState() {
    _current = 0;
    loadSliderInfo();
    super.initState();
  }

  Future loadSliderInfo() async {
    try {
      listSlider = await SliderController().getAllSlider();
      if (listSlider.isNotEmpty) {
        setState(() {
          listSlider;
          loadProcessBar = true;
        });
      } else {
        setState(() {
          listSlider = _imageList;
          loadProcessBar = true;
          isNotfound = true;
        });
      }
    } catch (error) {
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return loadProcessBar
        ? Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _buildBanner(),
              _buildIndication(),
            ],
          )
        : LoadDialog(context);
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
            setState(() {
              _current = index;
            });
          },
        ),
        items: isNotfound == false
            ? listSlider
                .map(
                  (item) => Image.network(
                    item.sliderURL.toString(),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                )
                .toList()
            : _imageList
                .map(
                  (item) => Image.asset(
                    item.sliderURL.toString(),
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
        left: MediaQuery.of(context).size.width / 2 - 20,
        child: Row(
          children: isNotfound == false
              ? listSlider.map((url) {
                  int index = listSlider.indexOf(url);
                  return Container(
                    width: 8,
                    height: _current == index ? 8 : 1,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: _current == index
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                  );
                }).toList()
              : _imageList.map((url) {
                  int index = _imageList.indexOf(url);
                  return Container(
                    width: 8,
                    height: _current == index ? 8 : 1,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      shape: _current == index
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                      color: Colors.transparent,
                    ),
                  );
                }).toList(),
        ),
      );
}
