// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/BarberModel.dart';
import '../../Utility/WidgetUtility.dart';

class BarberWidget extends StatefulWidget {
  const BarberWidget({super.key});

  @override
  State<BarberWidget> createState() => _BarberWidgetState();
}

class _BarberWidgetState extends State<BarberWidget> {
  List<BarberModel> listBarberModel = [
    BarberModel(
        barberID: "1",
        barberName: "Lit",
        branchID: "1",
        urlImage: "assets/images/lit.jpg"),
    BarberModel(
        barberID: "2",
        barberName: "Kaiy",
        branchID: "1",
        urlImage: "assets/images/kaiy.jpg"),
    BarberModel(
        barberID: "3",
        barberName: "Koung",
        branchID: "1",
        urlImage: "assets/images/koung.jpg"),
    BarberModel(
        barberID: "4",
        barberName: "Jaem",
        branchID: "1",
        urlImage: "assets/images/jaem.jpg"),
    BarberModel(
        barberID: "5",
        barberName: "Do",
        branchID: "1",
        urlImage: "assets/images/do.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 248, 246, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  getTranslated(context, 'BARBER_LIST')!,
                  Colors.black,
                  18,
                  FontWeight.bold,
                  TextAlign.center,
                ),
              ],
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: size.width,
              height: 220,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listBarberModel.length,
                itemBuilder: (context, index) {
                  BarberModel barberModel = listBarberModel[index];
                  return GestureDetector(
                    onTap: () async {},
                    child: Card(
                      elevation: 3,
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
                            child: Image.asset(
                              barberModel.urlImage.toString(),
                              width: 130,
                              height: 160,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Center(
                            child: TextWidget(
                              barberModel.barberName.toString(),
                              Colors.black,
                              16,
                              FontWeight.bold,
                              TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
