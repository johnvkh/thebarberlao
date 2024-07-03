// ignore_for_file: file_names, unused_field
import 'package:flutter/material.dart';
import 'package:thebarberlao/src/ComponentsUtils/ChooseLanguageWidget.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.scrollController,
    required this.isShow,
  });

  final TrackingScrollController scrollController;
  final bool isShow;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color? _backgroundColor;
  Color? _backgroundColorSearch;
  Color? _colorIcon;
  double? _opacity;
  double? _offset;
  final _opacityMax = 0.01;

  @override
  void initState() {
    // TODO: implement initState
    _backgroundColor = Colors.transparent;
    _backgroundColorSearch = Colors.white;
    _colorIcon = Colors.white;
    _opacity = 0.0;
    _offset = 0.0;
    widget.scrollController.addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: _backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          width: size.width,
          height: 50,
          color: const Color.fromRGBO(44, 44, 44, 1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                if (widget.isShow == true)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                      },
                      icon: const Icon(
                        Icons.arrow_back_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                const Text(
                  "THE BAR-BER LAO",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Anton',
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const Expanded(child: SizedBox()),
                const ChooseLanguageWidget(color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onScroll() {
    final scrollOffset = widget.scrollController.offset;
    if (scrollOffset >= _offset! && scrollOffset > 5) {
      _opacity = double.parse((_opacity! + _opacityMax).toStringAsFixed(2));
      if (_opacity! >= 1.0) {
        _opacity = 1.0;
      }
      //up
    } else if (scrollOffset < 100) {
      _opacity = double.parse((_opacity! - _opacityMax).toStringAsFixed(2));
      if (_opacity! <= 1.0) {
        _opacity = 0.0;
      }
      //down
    }
    setState(() {
      if (scrollOffset <= 0) {
        _backgroundColorSearch = Colors.white;
        _colorIcon = Colors.white;
        _opacity = 0.0;
        _offset = 0.0;
      } else {
        _backgroundColorSearch = Colors.grey[200];
        _colorIcon = Colors.deepOrange;
        _opacity = 1;
      }
      _backgroundColor = Colors.white.withOpacity(_opacity!);
    });
  }
}
