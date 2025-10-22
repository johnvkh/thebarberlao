// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thebarberlao/src/Utility/WidgetUtility.dart';
import '../Localization/LanguageConstants.dart';

class FooterMenu extends StatefulWidget {
  const FooterMenu({super.key});

  @override
  State<FooterMenu> createState() => _FooterMenuState();
}

class _FooterMenuState extends State<FooterMenu> {
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    final locale = await getLocale();
    if (mounted) {
      setState(() {
        _locale = locale;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var deviceType = getDeviceType(MediaQuery.of(context).size);
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: deviceType == DeviceScreenType.mobile ? _buildMobileFooter() : _buildDesktopFooter(size),
    );
  }

  /// 📱 Mobile Footer
  Widget _buildMobileFooter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionTitle("Branches"),
        const SizedBox(height: 10),
        _branchItem(_locale?.languageCode == "lo" ? "ສາຂາ ດົງໂດກ" : "Dongdok Branch"),
        _branchItem(_locale?.languageCode == "lo" ? "ສາຂາ ສະພານທອງ" : "Saphanthong Branch"),
        _branchItem(_locale?.languageCode == "lo" ? "ສາຂາ ແຄມຂອງ" : "Mekhong Branch"),
        const SizedBox(height: 25),
        _sectionTitle("Contact"),
        const SizedBox(height: 10),
        _contactItem(FontAwesomeIcons.phone, "020 55 395 558"),
        _contactItem(FontAwesomeIcons.facebookF, "The Barber Lao"),
        _contactItem(FontAwesomeIcons.whatsapp, "020 55 395 558"),
      ],
    );
  }

  /// 💻 Desktop Footer
  Widget _buildDesktopFooter(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("assets/images/LOGO01.png", width: 200, height: 100),
            const SizedBox(height: 10),
            TextWidget(
              "The best Barber Shop in Laos",
              Colors.black54,
              14,
              FontWeight.bold,
              TextAlign.start,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(_locale?.languageCode == "lo" ? "Branches" : "ສາຂາ"),
            const SizedBox(height: 10),
            _branchItem(_locale?.languageCode == "lo" ? "ສາຂາ ດົງໂດກ" : "Dongdok Branch"),
            _branchItem(_locale?.languageCode == "lo" ? "ສາຂາ ສະພານທອງ" : "Saphanthong Branch"),
            _branchItem(_locale?.languageCode == "lo" ? "ສາຂາ ແຄມຂອງ" : "Mekhong Branch"),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(_locale?.languageCode == "lo" ? "Contact" : "ຕິດຕໍ່"),
            const SizedBox(height: 10),
            _contactItem(FontAwesomeIcons.phone, "020 55 395 558"),
            _contactItem(FontAwesomeIcons.facebookF, "The Barber Lao"),
            _contactItem(FontAwesomeIcons.whatsapp, "020 55 395 558"),
          ],
        ),
      ],
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _branchItem(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: Text(text, style: const TextStyle(color: Colors.black87, fontSize: 15)),
      );

  Widget _contactItem(IconData icon, String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.black,
              child: Icon(icon, color: Colors.white, size: 14),
            ),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(color: Colors.black87, fontSize: 15)),
          ],
        ),
      );
}
