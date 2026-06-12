// ignore_for_file: file_names, unused_field
import 'package:flutter/material.dart';
import 'package:thebarberlao/src/ComponentsUtils/ChooseLanguageWidget.dart';

class Header extends StatefulWidget {
  const Header({
    super.key,
    required this.scrollController,
    required this.isShow,
  });

  final TrackingScrollController scrollController;
  final bool isShow;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  static const _darkColor = Color(0xFF1A1A2E);
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    final scrolled = widget.scrollController.offset > 10;
    if (scrolled != _isScrolled) {
      setState(() => _isScrolled = scrolled);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        color: _darkColor,
        boxShadow: _isScrolled
            ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ]
            : [],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            // ─── Back Button (ສະແດງຄັ້ງດຽວ) ──────────────────────
            if (widget.isShow)
              IconButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (_) => false,
                ),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                tooltip: "Back",
                padding: EdgeInsets.zero,        // ✅ ລຶບ padding ຊ້ຳ
                constraints: const BoxConstraints(),
                splashRadius: 20,
              ),

            if (widget.isShow) const SizedBox(width: 4),

            // ─── Logo + Brand ─────────────────────────────────────
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Image.asset(
                    "assets/images/LOGO01.png",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  "THE BAR-BER LAO",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Anton',
                    letterSpacing: 1.5,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

            const Spacer(),

            // ─── Gold dot ─────────────────────────────────────────
            Container(
              width: 5,
              height: 5,
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                color: Color(0xFFD4A85A),
                shape: BoxShape.circle,
              ),
            ),

            // ─── Language ─────────────────────────────────────────
            const ChooseLanguageWidget(color: Colors.white),
          ],
        ),
      ),
    );
  }
}