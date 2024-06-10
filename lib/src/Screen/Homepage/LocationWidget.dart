import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Utility/Constants.dart';
import '../../Utility/WidgetUtility.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late GoogleMapController mapController;
  BitmapDescriptor? pinLocationIcon;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    // findLatLng();
    super.initState();
  }

  Future<Null> findLatLng() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 2.5),
        'assets/images/logomark.png');
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    // return Column(
    //   children: [
    //     Container(
    //       child: Row(
    //         children: [
    //           Column(
    //             children: [
    //               TextWidget(
    //                 "ສາຂາດົງໂດກ, ໄຊເສດຖາມ, ນະຄອນຫຼວງວຽງຈັນ, ສ.ປ.ປ ລາວ",
    //                 Colors.black,
    //                 14,
    //                 FontWeight.bold,
    //                 TextAlign.center,
    //               ),
    //               Container(
    //                 width: size.width/2,
    //                 height: 200,
    //                 color: const Color.fromRGBO(54, 52, 53, 1),
    //                 child: Padding(
    //                   padding: const EdgeInsets.all(10.0),
    //                   child: GoogleMap(
    //                     markers: myMarker(),
    //                     onMapCreated: _onMapCreated,
    //                     initialCameraPosition: const CameraPosition(
    //                       target: LatLng(17.964569127655977, 102.60421459482328),
    //                       zoom: 14.0,
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ],
    // );

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          height: 590,
          child: Column(
            children: [
              TextWidget(
                "ສາຂາຂອງ The Barber Lao",
                Colors.black,
                20,
                FontWeight.bold,
                TextAlign.start,
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
                },
                child: Card(
                  elevation: 3,
                  // color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: GoogleMap(
                            markers: myMarker(),
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(
                                  17.964569127655977, 102.60421459482328),
                              zoom: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 15, bottom: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWidget(
                                "The Barber Lao ສາຂາ ດົງໂດກ",
                                Colors.black,
                                18,
                                FontWeight.bold,
                                TextAlign.start,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    color: kSecondaryColor.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    "ບ້ານ ດົງໂດກ, ເມືອງ ໄຊເສດຖາ, ນະຄອນ\nຫຼວງວຽງຈັນ",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.phone,
                                    color: kSecondaryColor.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    "020 90 845 155",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.map,
                                      color: kSecondaryColor.withOpacity(1),
                                      size: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    TextWidget(
                                      "open map",
                                      Colors.black,
                                      14,
                                      FontWeight.bold,
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
                },
                child: Card(
                  elevation: 3,
                  // color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: GoogleMap(
                            markers: myMarker(),
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(
                                  17.964569127655977, 102.60421459482328),
                              zoom: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 15, bottom: 10, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWidget(
                                "The Barber Lao ສາຂາ ສະພານທອງ",
                                Colors.black,
                                18,
                                FontWeight.bold,
                                TextAlign.start,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    color: kSecondaryColor.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    "ບ້ານ ສະພານທອງ, ເມືອງ ໄຊເສດຖາ, ນະຄອນ\nຫຼວງວຽງຈັນ",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.phone,
                                    color: kSecondaryColor.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    "020 90 845 155",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.map,
                                      color: kSecondaryColor.withOpacity(1),
                                      size: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    TextWidget(
                                      "open map",
                                      Colors.black,
                                      14,
                                      FontWeight.bold,
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
                },
                child: Card(
                  elevation: 3,
                  // color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: GoogleMap(
                            markers: myMarker(),
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: const CameraPosition(
                              target: LatLng(
                                  17.964569127655977, 102.60421459482328),
                              zoom: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          margin: const EdgeInsets.only(
                            left: 15,
                            bottom: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextWidget(
                                "The Barber Lao ສາຂາແຄມຂອງ",
                                Colors.black,
                                18,
                                FontWeight.bold,
                                TextAlign.start,
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    color: kSecondaryColor.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    "ບ້ານ ສະພານທອງ, ເມືອງ ໄຊເສດຖາ, ນະຄອນ\nຫຼວງວຽງຈັນ",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.phone,
                                    color: kSecondaryColor.withOpacity(0.5),
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  TextWidget(
                                    "020 90 845 155",
                                    Colors.black,
                                    14,
                                    FontWeight.normal,
                                    TextAlign.start,
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  await launchUrl(Uri.parse(
                                      "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.map,
                                      color: kSecondaryColor.withOpacity(1),
                                      size: 18,
                                    ),
                                    const SizedBox(width: 10),
                                    TextWidget(
                                      "open map",
                                      Colors.black,
                                      14,
                                      FontWeight.bold,
                                      TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>{
      Marker(
        onTap: () async {
          await launchUrl(Uri.parse(
              "https://www.google.com/maps/place/The+Barber+Lao+%E0%BA%AA%E0%BA%B2%E0%BA%82%E0%BA%B2+%E0%BB%81%E0%BA%84%E0%BA%A1%E0%BA%82%E0%BA%AD%E0%BA%87/@17.9643441,102.6041947,46m/data=!3m1!1e3!4m14!1m7!3m6!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!2zVGhlIEJhcmJlciBMYW8g4Lqq4Lqy4LqC4LqyIOC7geC6hOC6oeC6guC6reC6hw!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn!3m5!1s0x3124699ceea059c7:0x3dd1bec1ad7f27e!8m2!3d17.964314!4d102.6042146!16s%2Fg%2F11fmfkq8rn?entry=ttu"));
        },
        markerId: const MarkerId('myShop'),
        icon: BitmapDescriptor.defaultMarker,
        position: const LatLng(17.964569127655977, 102.60421459482328),
        infoWindow: const InfoWindow(
            title: 'The barber Lao',
            snippet: '17.964569127655977 - 102.60421459482328'),
      )
    };
  }
}
