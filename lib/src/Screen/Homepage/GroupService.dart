import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../Localization/LanguageConstants.dart';

class GroupService extends StatefulWidget {
  const GroupService({super.key});

  @override
  State<GroupService> createState() => _GroupServiceState();
}

class _GroupServiceState extends State<GroupService>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Locale? _locale;

  final List<String> _extraImages = [
    "assets/images/barber/1.jpeg",
    "assets/images/barber/2.jpeg",
    "assets/images/barber/3.jpeg",
    "assets/images/barber/5.jpeg",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    getLocale().then((locale) {
      if (!mounted) return;
      setState(() => _locale = locale);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool get _isLao => _locale?.languageCode == "lo";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceType = getDeviceType(size);
    final isMobile = deviceType == DeviceScreenType.mobile;
    final title = getTranslated(context, 'OUR_SERVICES') ?? 'Our Services';
    final tabHeight = isMobile ? 210.0 : 200.0;
    // final tabHeight = isMobile ? 360.0 : 380.0;
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
            ],
          ),
          const SizedBox(height: 20),

          // ─── Tab Bar ─────────────────────────────────────────────
          Container(
            height: 42,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              tabs: [
                _tab(getTranslated(context, 'SERVICE_MAN') ?? "Men",
                    Icons.male_rounded),
                _tab(getTranslated(context, 'SERVICE_WOMAN') ?? "Women",
                    Icons.female_rounded),
                _tab(getTranslated(context, 'ADDITIONAL_SERVICE') ?? "Extra",
                    Icons.auto_awesome_rounded),
              ],
              indicator: BoxDecoration(
                color: const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xFF888888),
              labelStyle: const TextStyle(
                  fontSize: 12, fontWeight: FontWeight.w600),
              unselectedLabelStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              splashFactory: NoSplash.splashFactory,
            ),
          ),
          const SizedBox(height: 16),

          // ─── Tab Content ─────────────────────────────────────────
          SizedBox(
            height: tabHeight,
            child: TabBarView(
              controller: _tabController,
              children: [
                // _ServiceCard(
                //   image: _isLao
                //       ? "assets/images/MaleServiceLao.png"
                //       : "assets/images/MaleServiceEN.png",
                //   label: getTranslated(context, 'SERVICE_MAN') ?? "Men",
                //   route: "/MaleService",
                // ),
                // _ServiceCard(
                //   image: _isLao
                //       ? "assets/images/FemaleServiceLA.png"
                //       : "assets/images/FemaleServiceEN.png",
                //   label: getTranslated(context, 'SERVICE_WOMAN') ?? "Women",
                //   route: "/FemaleService",
                // ),
                // _ExtraServiceGrid(
                //   images: _extraImages,
                //   route: "/ExtraService",
                //   label: getTranslated(context, 'ADDITIONAL_SERVICE') ?? "Extra",
                // ),
                _ServiceCard(
                  label: getTranslated(context, 'SERVICE_MAN') ?? "Men",
                  route: "/MaleService",
                  icon: Icons.content_cut_rounded,
                  accentColor: const Color(0xFFD4A85A),
                  description: getTranslated(context, 'SERVICE_MAN_DESC')
                      ?? "Haircut, styling & more",
                  image: _isLao             // ✅ ຮູບເດີມ
                      ? "assets/images/MaleServiceLao.png"
                      : "assets/images/MaleServiceEN.png",
                ),
                _ServiceCard(
                  label: getTranslated(context, 'SERVICE_WOMAN') ?? "Women",
                  route: "/FemaleService",
                  icon: Icons.face_retouching_natural,
                  accentColor: const Color(0xFFE8A0BF),
                  description: getTranslated(context, 'SERVICE_WOMAN_DESC')
                      ?? "Beauty & hair treatment",
                  image: _isLao             // ✅ ຮູບເດີມ
                      ? "assets/images/FemaleServiceLA.png"
                      : "assets/images/FemaleServiceEN.png",
                ),
                _ExtraServiceGrid(
                  images: _extraImages,
                  route: "/ExtraService",
                  label: getTranslated(context, 'ADDITIONAL_SERVICE') ?? "Extra",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Tab _tab(String text, IconData icon) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14),
          const SizedBox(width: 5),
          Text(text),
        ],
      ),
    );
  }
}

// ─── Service Card ─────────────────────────────────────────────────────────────

// class _ServiceCard extends StatelessWidget {
//   final String image;
//   final String label;
//   final String route;
//
//   const _ServiceCard({
//     required this.image,
//     required this.label,
//     required this.route,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () =>
//           Navigator.pushNamedAndRemoveUntil(context, route, (_) => false),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.12),
//               blurRadius: 16,
//               offset: const Offset(0, 4),
//             ),
//           ],
//         ),
//         clipBehavior: Clip.antiAlias,
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//             // Image
//             Image.asset(image, fit: BoxFit.contain,),
//             // Gradient overlay
//             Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Colors.black.withOpacity(0.55),
//                     Colors.transparent,
//                     Colors.transparent,
//                   ],
//                   begin: Alignment.bottomCenter,
//                   end: Alignment.topCenter,
//                   stops: const [0.0, 0.5, 1.0],
//                 ),
//               ),
//             ),
//
//             // Bottom label + CTA
//             Positioned(
//               bottom: 16,
//               left: 16,
//               right: 16,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     label,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Text(
//                           "View",
//                           style: TextStyle(
//                             color: Color(0xFF1A1A2E),
//                             fontSize: 11,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Icon(Icons.arrow_forward_ios_rounded,
//                             size: 10, color: Color(0xFF1A1A2E)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// ─── Service Card ─────────────────────────────────────────────────────────────

class _ServiceCard extends StatelessWidget {
  final String label;
  final String route;
  final IconData icon;
  final Color accentColor;
  final String description;
  final String image;

  const _ServiceCard({
    required this.label,
    required this.route,
    required this.icon,
    required this.accentColor,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamedAndRemoveUntil(context, route, (_) => false),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // ─── Dot pattern ──────────────────────────────────────
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CustomPaint(painter: _DotPatternPainter()),
              ),
            ),

            // ─── Accent bar top ───────────────────────────────────
            Positioned(
              top: 0, left: 0, right: 0,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16)),
                ),
              ),
            ),

            // ─── Row: Left info + Right image ─────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Row(
                children: [
                  // ─── Left: icon + text + button ─────────────────
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: accentColor.withOpacity(0.35),
                              width: 1.5,
                            ),
                          ),
                          child: Icon(icon, color: accentColor, size: 18),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          description,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // CTA button
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 7),
                          decoration: BoxDecoration(
                            color: accentColor,
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: accentColor.withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "View All",
                                style: TextStyle(
                                  color: Color(0xFF1A1A2E),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 11, color: Color(0xFF1A1A2E)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // ─── Right: single image ─────────────────────────
                  Expanded(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                        height: double.infinity,
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
}

// ─── Pulsing Dot (hint animation) ────────────────────────────────────────────

class _PulsingDot extends StatefulWidget {
  final Color color;
  const _PulsingDot({required this.color});

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);
    _scale = Tween<double>(begin: 0.8, end: 1.3).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ScaleTransition(
          scale: _scale,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          "Tap anywhere",
          style: TextStyle(
            color: widget.color.withOpacity(0.6),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

// ─── Dot Pattern Background ───────────────────────────────────────────────────

class _DotPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..style = PaintingStyle.fill;

    const spacing = 22.0;
    const radius = 1.5;

    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        canvas.drawCircle(Offset(x, y), radius, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ─── Extra Service Grid ───────────────────────────────────────────────────────

class _ExtraServiceGrid extends StatelessWidget {
  final List<String> images;
  final String route;
  final String label;

  const _ExtraServiceGrid({
    required this.images,
    required this.route,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final items = images.take(2).toList(); // ✅ ສະແດງ 2 ຮູບ — 1 row

    return GestureDetector(
      onTap: () =>
          Navigator.pushNamedAndRemoveUntil(context, route, (_) => false),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A2E),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Dot pattern
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CustomPaint(painter: _DotPatternPainter()),
              ),
            ),

            // Accent bar
            Positioned(
              top: 0, left: 0, right: 0,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  color: const Color(0xFF9B8BFF), // purple accent
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14), // ✅ ຫຼຸດຈາກ 20→14
              child: Row(
                children: [
                  // ─── Left: icon + text ─────────────────────────
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 36,    // ✅ ຫຼຸດຈາກ 48→36
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9B8BFF).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color(0xFF9B8BFF).withOpacity(0.35),
                              width: 1.5,
                            ),
                          ),
                          child: const Icon(
                            Icons.auto_awesome_rounded,
                            color: Color(0xFF9B8BFF),
                            size: 18,   // ✅ ຫຼຸດຈາກ 22→18
                          ),
                        ),
                        const SizedBox(height: 8),  // ✅ ຫຼຸດຈາກ 12→8
                        Text(
                          label,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,           // ✅ ຫຼຸດຈາກ 20→18
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 2),  // ✅ ຫຼຸດຈາກ 4→2
                        Text(
                          "Special treatments",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 10,           // ✅ ຫຼຸດຈາກ 11→10
                          ),
                        ),
                        const SizedBox(height: 10), // ✅ ຫຼຸດຈາກ 16→10
                        // CTA button
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 7), // ✅ ຫຼຸດ padding
                          decoration: BoxDecoration(
                            color: const Color(0xFF9B8BFF),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF9B8BFF).withOpacity(0.4),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,     // ✅ ຫຼຸດຈາກ 12→11
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.arrow_forward_rounded,
                                  size: 11, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12), // ✅ ຫຼຸດຈາກ 16→12

                  // ─── Right: 2 preview images ───────────────────
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: items.asMap().entries.map((e) {
                        return Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: e.key == 0 ? 0 : 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                e.value,
                                fit: BoxFit.cover,
                                height: double.infinity,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
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
}

class _ExtraItem extends StatelessWidget {
  final String image;
  const _ExtraItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(image, fit: BoxFit.cover),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.3),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // ✅ Plus icon
          const Positioned(
            bottom: 8,
            right: 8,
            child: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.white,
              child: Icon(Icons.add_rounded,
                  size: 14, color: Color(0xFF1A1A2E)),
            ),
          ),
        ],
      ),
    );
  }
}