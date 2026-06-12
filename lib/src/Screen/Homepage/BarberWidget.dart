// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  List<BarberModel> listBarber = [];
  bool loadProcessBar = false;

  @override
  void initState() {
    super.initState();
    loadBarberInfo();
  }

  Future<void> loadBarberInfo() async {
    try {
      if (kDebugMode) print("----- loadBarberInfo -----");
      final data = await BarberController().getAllBarber();
      if (!mounted) return;
      setState(() {
        listBarber = data;
        loadProcessBar = true;
      });
    } catch (error) {
      if (!mounted) return;
      if (kDebugMode) print("Error loadBarberInfo: $error");
      setState(() => loadProcessBar = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!loadProcessBar) return LoadDialog(context);

    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final size = MediaQuery.of(context).size;
    final isMobile = deviceType == DeviceScreenType.mobile
        || deviceType == DeviceScreenType.tablet;
    final title = getTranslated(context, 'BARBER_LIST') ?? 'Barber List';
    final bookLabel = getTranslated(context, 'BOOK_NOW') ?? 'Book Now';

    return Container(
      color: const Color(0xFFF8F4F2),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 40,
        vertical: 28,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Section Header ─────────────────────────────────────
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
              const SizedBox(width: 10),
              // ✅ barber count badge
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A2E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${listBarber.length}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ─── Cards ──────────────────────────────────────────────
          if (isMobile)
            SizedBox(
              height: size.height * 0.52,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                addAutomaticKeepAlives: false,
                itemCount: listBarber.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (_, i) => _BarberCard(
                  barber: listBarber[i],
                  width: size.width * 0.72,
                  bookLabel: bookLabel,
                ),
              ),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemCount: listBarber.length,
              itemBuilder: (_, i) => _BarberCard(
                barber: listBarber[i],
                width: double.infinity,
                bookLabel: bookLabel,
              ),
            ),
        ],
      ),
    );
  }
}

// ─── Barber Card ─────────────────────────────────────────────────────────────

class _BarberCard extends StatelessWidget {
  final BarberModel barber;
  final double width;
  final String bookLabel;

  const _BarberCard({
    required this.barber,
    required this.width,
    required this.bookLabel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 14,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Photo ──────────────────────────────────────────
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Image
                  Image.network(
                    barber.imageURL ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFEEEEEE),
                      child: const Center(
                        child: Icon(Icons.person_outline_rounded,
                            size: 56, color: Color(0xFFBBBBBB)),
                      ),
                    ),
                    loadingBuilder: (_, child, progress) => progress == null
                        ? child
                        : Container(
                      color: const Color(0xFFF0F0F0),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                    ),
                  ),

                  // ✅ Gradient bottom
                  Positioned(
                    bottom: 0, left: 0, right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),

                  // ✅ Position badge — top left
                  if (barber.position?.isNotEmpty == true)
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A1A2E).withOpacity(0.85),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          barber.position!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                  // ✅ Scissors icon — top right
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD4A85A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: FaIcon(
                          FontAwesomeIcons.scissors,
                          size: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ─── Info ────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name
                  Text(
                    barber.barberName ?? "Unknown",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Phone
                  if (barber.phoneNumber?.isNotEmpty == true) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.phone_outlined,
                            size: 11, color: Color(0xFFAAAAAA)),
                        const SizedBox(width: 5),
                        Text(
                          barber.phoneNumber!,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF888888),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 10),

                  // ─── Book Button ───────────────────────────────
                  GestureDetector(
                    onTap: () => _showComingSoon(context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            FontAwesomeIcons.calendarCheck,
                            size: 11,
                            color: Color(0xFFD4A85A),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            bookLabel,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
        backgroundColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFD4A85A).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: FaIcon(
                    FontAwesomeIcons.rocket,
                    color: Color(0xFFD4A85A),
                    size: 24,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Coming Soon",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Online booking will be available\nin the next update.",
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF888888),
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A2E),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}