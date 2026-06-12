// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../ComponentsUtils/DialogPopupWidget.dart';
import '../../Controller/PriceServiceController.dart';
import '../../Localization/LanguageConstants.dart';
import '../../Model/PriceServiceModel.dart';
import '../../Utility/WidgetUtility.dart';

class MenuService extends StatefulWidget {
  const MenuService({super.key});

  @override
  State<MenuService> createState() => _MenuServiceState();
}

class _MenuServiceState extends State<MenuService> {
  List<PriceServiceModel> listPriceService = [];
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
    loadPriceServerInfo();
  }

  Future<void> loadPriceServerInfo() async {
    try {
      final data = await PriceServiceController().getAllPriceService();
      if (!mounted) return;
      setState(() {
        listPriceService = data;
        loadProcessBar = true;
        isNotfound = data.isEmpty;
      });
    } catch (error) {
      if (!mounted) return;
      if (kDebugMode) print("Error loadPriceServerInfo: $error");
      setState(() {
        loadProcessBar = true;
        isNotfound = true;
      });
    }
  }

  bool get _isLao => _locale?.languageCode == "lo";

  @override
  Widget build(BuildContext context) {
    if (!loadProcessBar) return LoadDialog(context);

    final title = getTranslated(context, 'PRICE_LIST') ?? 'Price List';

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg222.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        // ✅ Dark overlay ໃຫ້ text ອ່ານງ່າຍ
        color: Colors.black.withOpacity(0.55),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ─── Header ───────────────────────────────────────────
            Row(
              children: [
                Container(
                  width: 3,
                  height: 22,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4A85A),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(width: 10),
                // item count badge
                if (listPriceService.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4A85A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "${listPriceService.length}",
                      style: const TextStyle(
                        color: Color(0xFF1A1A2E),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // ─── Divider ──────────────────────────────────────────
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFD4A85A).withOpacity(0.6),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // ─── Empty state ──────────────────────────────────────
            if (isNotfound)
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    getTranslated(context, 'NOT_FOUND') ?? 'No data found',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    ),
                  ),
                ),
              )

            // ─── Price List ───────────────────────────────────────
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listPriceService.length,
                separatorBuilder: (_, __) => Container(
                  height: 1,
                  margin: const EdgeInsets.symmetric(vertical: 2),
                  color: Colors.white.withOpacity(0.06),
                ),
                itemBuilder: (context, index) {
                  final item = listPriceService[index];
                  final name = _isLao
                      ? (item.priceServiceNameLA ?? '')
                      : (item.priceServiceNameEN ?? '');
                  final price = _isLao
                      ? (item.priceLA ?? '')
                      : (item.priceEN ?? '');
                  final isEven = index % 2 == 0;

                  return _PriceRow(
                    index: index + 1,
                    name: name,
                    price: price,
                    isEven: isEven,
                  );
                },
              ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// ─── Price Row ────────────────────────────────────────────────────────────────

class _PriceRow extends StatelessWidget {
  final int index;
  final String name;
  final String price;
  final bool isEven;

  const _PriceRow({
    required this.index,
    required this.name,
    required this.price,
    required this.isEven,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: isEven
            ? Colors.white.withOpacity(0.05)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // ✅ Index number
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: const Color(0xFFD4A85A).withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: Text(
                "$index",
                style: const TextStyle(
                  color: Color(0xFFD4A85A),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Service name
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // ✅ Price badge
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFD4A85A).withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: const Color(0xFFD4A85A).withOpacity(0.4),
                width: 1,
              ),
            ),
            child: Text(
              price,
              style: const TextStyle(
                color: Color(0xFFD4A85A),
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}