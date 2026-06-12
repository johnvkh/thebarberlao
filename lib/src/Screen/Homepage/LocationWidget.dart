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
  List<BranchModel> listBranch = [];
  bool loadProcessBar = false;
  bool isNotfound = false;
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    getLocale().then((locale) {
      if (!mounted) return;
      setState(() => _locale = locale);
    });
    loadBranchInfo();
  }

  Future loadBranchInfo() async {
    try {
      listBranch = await BranchController().getAllBranch();
      if (!mounted) return;
      setState(() {
        loadProcessBar = true;
        isNotfound = listBranch.isEmpty;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final isDesktop = deviceType != DeviceScreenType.mobile;
    final title = getTranslated(context, 'BRANCH_LIST') ?? 'Branch List';
    final isLao = _locale?.languageCode == "lo";

    if (!loadProcessBar) return LoadDialog(context);

    return Container(
      color: const Color(0xFFF5F5F5),
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 40 : 16,
        vertical: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Header ───────────────────────────────────────────────
          Row(
            children: [
              Container(
                width: 3,
                height: 22,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                  letterSpacing: 0.3,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ─── Cards ────────────────────────────────────────────────
          if (isNotfound)
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: Text(
                getTranslated(context, 'NO_BRANCHES_FOUND') ?? 'No branches found',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isDesktop
                  ? (listBranch.length / 2).ceil()
                  : listBranch.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                if (isDesktop) {
                  // Desktop: 2 cards per row
                  final left = index * 2;
                  final right = left + 1;
                  return Row(
                    children: [
                      Expanded(
                        child: _BranchCard(
                          branch: listBranch[left],
                          isLao: isLao,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: right < listBranch.length
                            ? _BranchCard(
                          branch: listBranch[right],
                          isLao: isLao,
                        )
                            : const SizedBox(),
                      ),
                    ],
                  );
                }
                return _BranchCard(
                  branch: listBranch[index],
                  isLao: isLao,
                );
              },
            ),
        ],
      ),
    );
  }
}

// ─── Branch Card ─────────────────────────────────────────────────────────────

class _BranchCard extends StatelessWidget {
  final BranchModel branch;
  final bool isLao;

  const _BranchCard({required this.branch, required this.isLao});

  @override
  Widget build(BuildContext context) {
    final latitude = double.tryParse(branch.latitude ?? "0") ?? 0.0;
    final longitude = double.tryParse(branch.longitude ?? "0") ?? 0.0;
    final zoom = double.tryParse(branch.zoom ?? "14") ?? 14.0;
    final name = isLao ? branch.branchNameLA ?? "" : branch.branchNameEN ?? "";
    final address = isLao ? branch.addressLA ?? "" : branch.addressEN ?? "";
    final phone = branch.phoneNumber ?? "";
    final mapUrl = branch.googleMapURL ?? "";

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Map Preview (compact height) ──────────────────────
          SizedBox(
            height: 140,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: GoogleMap(
                    key: ValueKey('map_${latitude}_$longitude'),
                    onMapCreated: (_) {},
                    initialCameraPosition: CameraPosition(
                      target: LatLng(latitude, longitude),
                      zoom: zoom,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('$latitude$longitude'),
                        position: LatLng(latitude, longitude),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueRed,
                        ),
                        infoWindow:
                        const InfoWindow(title: 'The Barber Lao'),
                      ),
                    },
                    zoomControlsEnabled: false,
                    myLocationButtonEnabled: false,
                    scrollGesturesEnabled: false,
                    rotateGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                  ),
                ),
                // ✅ Tap overlay
                Positioned.fill(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        if (mapUrl.isNotEmpty) {
                          await launchUrl(Uri.parse(mapUrl));
                        }
                      },
                    ),
                  ),
                ),
                // ✅ "Tap to open" hint badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.55),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.open_in_new,
                            color: Colors.white, size: 10),
                        SizedBox(width: 4),
                        Text(
                          getTranslated(context, 'OPEN_MAP') ?? 'Open Maps',
                          style: TextStyle(
                              color: Colors.white, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ─── Info ─────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Branch name
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // Address
                _InfoRow(
                  icon: FontAwesomeIcons.locationDot,
                  text: address,
                  maxLines: 2,
                ),
                const SizedBox(height: 5),

                // Phone
                _InfoRow(
                  icon: FontAwesomeIcons.phone,
                  text: phone,
                ),
                const SizedBox(height: 12),

                // Divider
                const Divider(height: 1, color: Color(0xFFEEEEEE)),
                const SizedBox(height: 10),

                // Open Map button — compact text button style
                GestureDetector(
                  onTap: () async {
                    if (mapUrl.isNotEmpty) {
                      await launchUrl(Uri.parse(mapUrl));
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A2E),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          FontAwesomeIcons.mapLocationDot,
                          color: Colors.white,
                          size: 11,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        getTranslated(context, 'GET_DIRECTIONS') ?? 'Get Directions',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                        color: Color(0xFF888888),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Info Row ────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final int maxLines;

  const _InfoRow({
    required this.icon,
    required this.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Icon(icon, size: 11, color: const Color(0xFFAAAAAA)),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF666666),
              height: 1.5,
            ),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}