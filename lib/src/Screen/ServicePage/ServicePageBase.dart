// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/CategorieController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/CategorieModel.dart';
import '../../Utility/WidgetUtility.dart';
import '../Footer.dart';
import '../FooterMenu.dart';
import '../Header.dart';
import '../ImageManage/ImageServicePage.dart';

class ServicePageBase extends StatefulWidget {
  final String serviceType;
  final String titleKey;
  final Color accentColor;
  final String router;

  const ServicePageBase({
    super.key,
    required this.serviceType,
    required this.titleKey,
    required this.accentColor,
    required this.router,
  });

  @override
  State<ServicePageBase> createState() => _ServicePageBaseState();
}

class _ServicePageBaseState extends State<ServicePageBase> {
  final _scrollController = TrackingScrollController();
  List<CategorieModel> listCategorie = [];
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
    _loadCategorie();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadCategorie() async {
    try {
      final data = await CategorieController()
          .getCategorieByType(serviceType: widget.serviceType);
      if (!mounted) return;
      setState(() {
        listCategorie = data;
        loadProcessBar = true;
        isNotfound = data.isEmpty;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
    }
  }

  bool get _isLao => _locale?.languageCode == "lo";

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final isMobile = deviceType == DeviceScreenType.mobile;
    final size = MediaQuery.of(context).size;
    final title = getTranslated(context, widget.titleKey) ?? widget.titleKey;
    final unit = getTranslated(context, 'UNIT') ?? 'KIP';

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F4F2),
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 56),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : size.width * 0.08,
                      vertical: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ─── Header ─────────────────────────────
                        Row(
                          children: [
                            Container(
                              width: 3, height: 22,
                              decoration: BoxDecoration(
                                color: widget.accentColor,
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
                            if (loadProcessBar && !isNotfound)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: widget.accentColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  "${listCategorie.length}",
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

                        // ─── Content ─────────────────────────────
                        if (!loadProcessBar)
                          SizedBox(
                            height: size.height * 0.4,
                            child: Center(child: LoadDialog(context)),
                          )
                        else if (isNotfound)
                          _EmptyState(color: widget.accentColor)
                        else
                          ResponsiveStaggeredGridList(
                            desiredItemWidth: isMobile
                                ? size.width * 0.44
                                : size.width * 0.16,
                            children: listCategorie.map((item) =>
                                _CategoryCard(
                                  model: item,
                                  isLao: _isLao,
                                  accentColor: widget.accentColor,
                                  unit: unit,
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ImageServicePage(
                                        categorieName: item
                                            .categorieNameLA.toString(),
                                        router: widget.router,
                                      ),
                                    ),
                                  ),
                                ),
                            ).toList(),
                          ),
                      ],
                    ),
                  ),
                  const FooterMenu(),
                  const Footer(),
                ],
              ),
            ),
            Header(scrollController: _scrollController, isShow: true),
          ],
        ),
      ),
    );
  }
}

// ─── Category Card ────────────────────────────────────────────────────────────

class _CategoryCard extends StatelessWidget {
  final CategorieModel model;
  final bool isLao;
  final Color accentColor;
  final String unit;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.model,
    required this.isLao,
    required this.accentColor,
    required this.unit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final name = isLao
        ? model.categorieNameLA ?? ""
        : model.categorieNameEN ?? "";
    final price = model.price ?? "";

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Image ────────────────────────────────────────
            AspectRatio(
              aspectRatio: 1.0,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    model.urlImage ?? "",
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFFEEEEEE),
                      child: const Center(
                        child: Icon(Icons.image_outlined,
                            color: Color(0xFFBBBBBB), size: 40),
                      ),
                    ),
                    loadingBuilder: (_, child, progress) =>
                    progress == null
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
                  // Bottom gradient
                  Positioned(
                    bottom: 0, left: 0, right: 0,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.4),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                  // Arrow badge
                  Positioned(
                    bottom: 8, right: 8,
                    child: Container(
                      width: 26, height: 26,
                      decoration: BoxDecoration(
                        color: accentColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.arrow_forward_rounded,
                        color: Colors.white, size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ─── Info ──────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: accentColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: accentColor.withOpacity(0.35),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      "$price $unit",
                      style: TextStyle(
                        fontSize: 11,
                        color: accentColor,
                        fontWeight: FontWeight.w700,
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

// ─── Empty State ──────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final Color color;
  const _EmptyState({required this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            Icon(Icons.inbox_outlined,
                size: 48, color: color.withOpacity(0.4)),
            const SizedBox(height: 12),
            Text(
              getTranslated(context, 'NOT_FOUND') ?? 'No data found',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}