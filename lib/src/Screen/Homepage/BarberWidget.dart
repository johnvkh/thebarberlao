// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/BarberController.dart';
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
    // BarberModel(
    //     barberID: "1",
    //     barberName: "Lit",
    //     branchID: "1",
    //     urlImage: "assets/images/lit.jpg"),
    // BarberModel(
    //     barberID: "2",
    //     barberName: "Kaiy",
    //     branchID: "1",
    //     urlImage: "assets/images/kaiy.jpg"),
    // BarberModel(
    //     barberID: "3",
    //     barberName: "Koung",
    //     branchID: "1",
    //     urlImage: "assets/images/koung.jpg"),
    // BarberModel(
    //     barberID: "4",
    //     barberName: "Jaem",
    //     branchID: "1",
    //     urlImage: "assets/images/jaem.jpg"),
    // BarberModel(
    //     barberID: "5",
    //     barberName: "Do",
    //     branchID: "1",
    //     urlImage: "assets/images/do.jpg"),
  ];
  bool loadProcessBar = false;
  BarberModel barberModel = BarberModel();
  List<BarberModel> listBarber = [];
  int rowPerPage = 1;

  @override
  void initState() {
    // TODO: implement initState
    loadBarberInfo();
    super.initState();
  }

  Future loadBarberInfo() async {
    try {
      if (kDebugMode) {
        print("-----------------------loadBarberInfo------------------");
      }
      listBarber = await BarberController().getAllBarber();
      if (listBarber.isNotEmpty) {
        setState(() {
          listBarber;
          loadProcessBar = true;
        });
      } else {
        setState(() {
          loadProcessBar = true;
        });
      }
    } catch (error) {
      setState(() {
        loadProcessBar = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return loadProcessBar
        ? Container(
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
                  DeviceScreenType.mobile == deviceType
                      ? SizedBox(
                          width: size.width,
                          height: size.height * 0.6,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listBarber.length,
                            itemBuilder: (context, index) {
                              BarberModel barberModel = listBarber[index];
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
                                        child: Image.network(
                                          barberModel.imageURL.toString(),
                                          width: size.width * 0.85,
                                          height: size.height * 0.55,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          width: size.width * 0.6,
                          height: size.height*0.95,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listBarber.length,
                            itemBuilder: (context, index) {
                              BarberModel barberModel = listBarber[index];
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
                                        child: Image.network(
                                          barberModel.imageURL.toString(),
                                          width: size.width * 0.27,
                                          height: size.height*0.85,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
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
          )
        : LoadDialog(context);
  }
}
