import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/ComponentsUtils/IconButtonWidget.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.scrollController});

  final TrackingScrollController scrollController;

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
    var deviceType = getDeviceType(MediaQuery.of(context).size);
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
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Text(
                  "The barber lao",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'mountain',
                    color: Colors.white,
                  ),
                ),
                const Expanded(child: SizedBox()),
                IconButtonWidget(
                  press: () {},
                  width: 35,
                  height: 35,
                  widgetIcon: const Icon(Icons.menu),
                  color: Colors.white,
                ),
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
