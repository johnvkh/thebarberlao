// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final isMobile = deviceType == DeviceScreenType.mobile;
    final year = DateTime.now().year;

    return Container(
      width: double.infinity,
      color: const Color(0xFF12122A), // ✅ ຊ້ຳກວ່າ FooterMenu ໜ້ອຍໜຶ່ງ — ແຍກ zone ຊັດ
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 60,
        vertical: 14,
      ),
      child: isMobile
          ? Column(
        children: [
          _buildDivider(),
          const SizedBox(height: 12),
          Text(
            "© $year The Barber Lao",
            style: _style(Colors.white54, 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            "Powered by ULaoDev  •  All Rights Reserved",
            style: _style(Colors.white30, 11),
            textAlign: TextAlign.center,
          ),
        ],
      )
          : Column(
        children: [
          _buildDivider(),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                "© $year The Barber Lao  •  All Rights Reserved",
                style: _style(Colors.white38, 12),
              ),
              const Spacer(),
              Text(
                "Powered by ULaoDev",
                style: _style(Colors.white24, 11),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => Container(
    height: 1,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.transparent,
          Colors.white.withOpacity(0.08),
          Colors.transparent,
        ],
      ),
    ),
  );

  TextStyle _style(Color color, double size) => TextStyle(
    color: color,
    fontSize: size,
    letterSpacing: 0.3,
    fontWeight: FontWeight.w400,
  );
}