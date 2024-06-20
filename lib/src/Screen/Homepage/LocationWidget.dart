import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/BranchController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/BranchModel.dart';
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
  BranchModel branchModel = BranchModel();
  List<BranchModel> listBranch = [];
  bool loadProcessBar = false;
  bool isNotfound = false;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBranchInfo();
  }

  Future loadBranchInfo() async {
    try {
      listBranch = await BranchController().getAllBranch();
      if (listBranch.isNotEmpty) {
        setState(() {
          listBranch;
          loadProcessBar = true;
        });
      } else {
        setState(() {
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
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return loadProcessBar
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 248, 246, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextWidget(
                      getTranslated(context, 'BRANCH_LIST')!,
                      Colors.black,
                      20,
                      FontWeight.bold,
                      TextAlign.start,
                    ),
                    SizedBox(
                        width: size.width,
                        height: 390,
                        child: ListView.builder(
                          itemCount: listBranch.length,
                          itemBuilder: (context, index) {
                            BranchModel branchModel = listBranch[index];
                            double latitude =
                                double.parse(branchModel.latitude.toString());
                            double longitude =
                                double.parse(branchModel.longitude.toString());
                            double zoom =
                                double.parse(branchModel.zoom.toString());
                            return GestureDetector(
                              onTap: () async {
                                await launchUrl(
                                  Uri.parse(branchModel.googleMapURL.toString()),
                                );
                              },
                              child: Card(
                                elevation: 3,
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
                                        width: 100,
                                        height: 100,
                                        child: GoogleMap(
                                          markers: myMarker(
                                            mapURL: branchModel.googleMapURL
                                                .toString(),
                                            latitude: latitude,
                                            longitude: longitude,
                                          ),
                                          onMapCreated: _onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(
                                              latitude,
                                              longitude,
                                            ),
                                            zoom: zoom,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextWidget(
                                              branchModel.branchName.toString(),
                                              Colors.black,
                                              16,
                                              FontWeight.bold,
                                              TextAlign.start,
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.locationDot,
                                                  color: kSecondaryColor
                                                      .withOpacity(0.5),
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  branchModel.address.toString(),
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily: 'roboto',
                                                  ),
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              children: [
                                                Icon(
                                                  FontAwesomeIcons.phone,
                                                  color: kSecondaryColor
                                                      .withOpacity(0.5),
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 10),
                                                TextWidget(
                                                  branchModel.phoneNumber
                                                      .toString(),
                                                  Colors.black,
                                                  13,
                                                  FontWeight.normal,
                                                  TextAlign.start,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                            GestureDetector(
                                              onTap: () async {
                                                await launchUrl(
                                                  Uri.parse(branchModel
                                                      .googleMapURL
                                                      .toString()),
                                                );
                                              },
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.map,
                                                    color: kSecondaryColor
                                                        .withOpacity(1),
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
                            );
                          },
                        )),
                  ],
                ),
              ),
            ),
          )
        : LoadDialog(context);
  }

  Set<Marker> myMarker({
    required String mapURL,
    required double latitude,
    required double longitude,
  }) {
    return <Marker>{
      Marker(
        onTap: () async {
          await launchUrl(
            Uri.parse(branchModel.googleMapURL.toString()),
          );
        },
        markerId: const MarkerId('myShop'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
            title: 'The Barber Lao', snippet: "$latitude - $longitude"),
      )
    };
  }
}
