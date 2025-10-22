// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/BranchController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/BranchModel.dart';
import '../../Utility/WidgetUtility.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  late GoogleMapController mapController;
  BranchModel branchModel = BranchModel();
  List<BranchModel> listBranch = [];
  bool loadProcessBar = false;
  bool isNotfound = false;
  Locale? _locale;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();
    loadBranchInfo();
  }

  Future loadBranchInfo() async {
    try {
      listBranch = await BranchController().getAllBranch();
      if (!mounted) return;
      if (listBranch.isNotEmpty) {
        setState(() {
          loadProcessBar = true;
        });
      } else {
        setState(() {
          loadProcessBar = true;
          isNotfound = true;
        });
      }
    } catch (error) {
      if (!mounted) return;
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    getLocale().then((locale) {
      if (!mounted) return;
      setState(() {
        _locale = locale;
      });
    });
    return loadProcessBar
        ? Container(
            color: const Color.fromRGBO(255, 248, 246, 1),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  getTranslated(context, 'BRANCH_LIST')!,
                  Colors.black87,
                  22,
                  FontWeight.bold,
                  TextAlign.start,
                ),
                const SizedBox(height: 15),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: deviceType == DeviceScreenType.mobile ? 1 : 2,
                    childAspectRatio: deviceType == DeviceScreenType.mobile
                        ? 2
                        : deviceType == DeviceScreenType.mobile
                            ? 2.5
                            : 3.5,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemCount: listBranch.length,
                  itemBuilder: (context, index) {
                    final branch = listBranch[index];
                    final latitude = double.parse(branch.latitude ?? "0");
                    final longitude = double.parse(branch.longitude ?? "0");
                    final zoom = double.parse(branch.zoom ?? "14");
                    return Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: SizedBox(
                                width: 140,
                                height: 140,
                                child: GoogleMap(
                                  onMapCreated: _onMapCreated,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(latitude, longitude),
                                    zoom: zoom,
                                  ),
                                  markers: myMarker(
                                    mapURL: branch.googleMapURL ?? "",
                                    latitude: latitude,
                                    longitude: longitude,
                                  ),
                                  zoomControlsEnabled: false,
                                  myLocationButtonEnabled: false,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            /// 📋 Branch Info
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  TextWidget(
                                    _locale?.languageCode == "lo"
                                        ? branch.branchNameLA ?? ""
                                        : branch.branchNameEN ?? "",
                                    Colors.black,
                                    16,
                                    FontWeight.bold,
                                    TextAlign.start,
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(FontAwesomeIcons.locationDot, size: 14, color: Colors.grey),
                                      const SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          _locale?.languageCode == "lo"
                                              ? branch.addressLA ?? ""
                                              : branch.addressEN ?? "",
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(FontAwesomeIcons.phone, size: 14, color: Colors.grey),
                                      const SizedBox(width: 6),
                                      Text(
                                        branch.phoneNumber ?? "",
                                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),

                                  /// 🔘 Open Map Button
                                  OutlinedButton.icon(
                                    onPressed: () async {
                                      await launchUrl(Uri.parse(branch.googleMapURL ?? ""));
                                    },
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: Colors.blueAccent,
                                      side: const BorderSide(color: Colors.blueAccent),
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    icon: const Icon(FontAwesomeIcons.map, size: 14),
                                    label: const Text("Open Map"),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
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
          await launchUrl(Uri.parse(mapURL));
        },
        markerId: const MarkerId('myShop'),
        icon: BitmapDescriptor.defaultMarker,
        position: LatLng(latitude, longitude),
        infoWindow: InfoWindow(
          title: 'The Barber Lao',
          snippet: "$latitude , $longitude",
        ),
      )
    };
  }
}
