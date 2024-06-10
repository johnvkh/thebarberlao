import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Utility/Constants.dart';
import '../../Utility/WidgetUtility.dart';

class BarberWidget extends StatefulWidget {
  const BarberWidget({super.key});

  @override
  State<BarberWidget> createState() => _BarberWidgetState();
}

class _BarberWidgetState extends State<BarberWidget> {
  @override
  Widget build(BuildContext context) {
    return                 Container(
      height: 590,
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {},
            child: Card(
              elevation: 3,
              // color: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: Hero(
                      tag: "Test1",
                      child: Image.asset(
                        "assets/images/hero3.jpg",
                        width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 15, bottom: 10, right: 10),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        TextWidget(
                          "ຂໍ້ມູນຊ່າງ",
                          Colors.black,
                          18,
                          FontWeight.bold,
                          TextAlign.start,
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
