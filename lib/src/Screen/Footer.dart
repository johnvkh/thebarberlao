// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      color: const Color(0xFF2C2C2C), // ดำเข้ม
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: deviceType == DeviceScreenType.mobile
            ? _buildMobileFooter()
            : _buildDesktopFooter(size),
      ),
    );
  }

  /// 📱 Mobile
  Widget _buildMobileFooter() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Divider(color: Colors.grey),
        const SizedBox(height: 8),
        TextWidget(
          "© The Barber Lao. Powered by ULaoDev",
          Colors.white70,
          14,
          FontWeight.w500,
          TextAlign.center,
        ),
        const SizedBox(height: 5),
        TextWidget(
          "All Rights Reserved 2025",
          Colors.grey,
          12,
          FontWeight.normal,
          TextAlign.center,
        ),
      ],
    );
  }

  /// 💻 Desktop
  Widget _buildDesktopFooter(Size size) {
    return Column(
      children: [
        const Divider(color: Colors.grey),
        const SizedBox(height: 10),
        Row(
          children: [
            TextWidget(
              "© The Barber Lao. Powered by ULaoDev",
              Colors.white70,
              14,
              FontWeight.w500,
              TextAlign.start,
            ),
            const Spacer(),
            TextWidget(
              "All Rights Reserved 2025",
              Colors.grey,
              12,
              FontWeight.normal,
              TextAlign.end,
            ),
          ],
        ),
      ],
    );
  }
}
