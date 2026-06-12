// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Localization/LanguageConstants.dart';
import '../Utility/WidgetUtility.dart';

class FooterMenu extends StatefulWidget {
  const FooterMenu({super.key});

  @override
  State<FooterMenu> createState() => _FooterMenuState();
}

class _FooterMenuState extends State<FooterMenu> {
  Locale? _locale;

  // ✅ Social links — ແກ້ URL ຕາມຈິງ
  static const _facebookUrl = 'https://facebook.com/thebarberlao';
  static const _whatsappUrl = 'https://wa.me/85655395558';
  static const _phoneUrl = 'tel:+85655395558';

  @override
  void initState() {
    super.initState();
    getLocale().then((locale) {
      if (!mounted) return;
      setState(() => _locale = locale);
    });
  }

  bool get _isLao => _locale?.languageCode == "lo";

  @override
  Widget build(BuildContext context) {
    final deviceType = getDeviceType(MediaQuery.of(context).size);
    final isMobile = deviceType == DeviceScreenType.mobile;

    return Container(
      width: double.infinity,
      color: const Color(0xFF1A1A2E),
      child: Column(
        children: [
          // ─── Main Footer Content ──────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 60,
              vertical: 48,
            ),
            child: isMobile ? _MobileContent(_isLao) : _DesktopContent(_isLao),
          ),

          // ─── Divider ─────────────────────────────────────────────
          Container(
            height: 1,
            color: Colors.white.withOpacity(0.08),
          ),

          // ─── Bottom Bar ──────────────────────────────────────────
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 60,
              vertical: 16,
            ),
            child: isMobile
                ? Column(
              children: [
                _SocialRow(
                  facebookUrl: _facebookUrl,
                  whatsappUrl: _whatsappUrl,
                  phoneUrl: _phoneUrl,
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SocialRow(
                  facebookUrl: _facebookUrl,
                  whatsappUrl: _whatsappUrl,
                  phoneUrl: _phoneUrl,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Desktop Layout ──────────────────────────────────────────────────────────

class _DesktopContent extends StatelessWidget {
  final bool isLao;
  const _DesktopContent(this.isLao);

  @override
  Widget build(BuildContext context) {
    // ✅ ໃຊ້ getTranslated ໄດ້ເລີຍ ຍ້ອນຢູ່ໃນ build(context)
    return Row(
      children: [
        // Brand
        Expanded(
          flex: 3,
          child: Column(
            children: [
              // ... logo ...
              Text(
                getTranslated(context, 'BEST_BARBER_LAOS')
                    ?? 'The best Barber Shop in Laos',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.55), fontSize: 13),
              ),
              // Rating badge
              Text(
                  "5.0  •  ${getTranslated(context, 'TRUSTED_CUSTOMERS') ?? 'Trusted by customers'}",
              ),
            ],
          ),
        ),
        // Branches
        Expanded(
          flex: 2,
          child: _FooterColumn(
            title: getTranslated(context, 'BRANCHES') ?? 'Branches',
            items: [
              _FooterLink(icon: Icons.location_on_outlined,
                  label: getTranslated(context, 'DONGDOK_BRANCH') ?? 'Dongdok Branch'),
              _FooterLink(icon: Icons.location_on_outlined,
                  label: getTranslated(context, 'SAPHANTHONG_BRANCH') ?? 'Saphanthong Branch'),
              _FooterLink(icon: Icons.location_on_outlined,
                  label: getTranslated(context, 'MEKHONG_BRANCH') ?? 'Mekhong Branch'),
            ],
          ),
        ),
        // Services
        Expanded(
          flex: 2,
          child: _FooterColumn(
            title: getTranslated(context, 'SERVICES') ?? 'Services',
            items: [
              _FooterLink(icon: Icons.content_cut_rounded,
                  label: getTranslated(context, 'HAIRCUT') ?? 'Haircut'),
              _FooterLink(icon: Icons.face_retouching_natural,
                  label: getTranslated(context, 'HAIR_STYLING') ?? 'Hair Styling'),
              _FooterLink(icon: Icons.spa_outlined,
                  label: getTranslated(context, 'FACIAL_CARE') ?? 'Facial Care'),
            ],
          ),
        ),
        // Contact
        Expanded(
          flex: 2,
          child: _FooterColumn(
            title: getTranslated(context, 'CONTACT') ?? 'Contact',
            items: [
              _FooterLink(icon: Icons.phone_outlined, label: "020 55 395 558",
                  url: 'tel:+85655395558'),
              _FooterLink(icon: FontAwesomeIcons.facebookF,
                  label: "The Barber Lao",
                  url: 'https://facebook.com/thebarberlao', isFa: true),
              _FooterLink(icon: FontAwesomeIcons.whatsapp,
                  label: "020 55 395 558",
                  url: 'https://wa.me/85655395558', isFa: true),
            ],
          ),
        ),
      ],
    );
  }
}

// ─── Mobile Layout ───────────────────────────────────────────────────────────

class _MobileContent extends StatelessWidget {
  final bool isLao;
  const _MobileContent(this.isLao);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Brand
        Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(4),
              child: Image.asset("assets/images/LOGO01.png",
                  fit: BoxFit.contain),
            ),
            const SizedBox(width: 10),
            const Text(
              "THE BARBER LAO",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Branches & Contact side by side
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _FooterColumn(
                title: isLao ? "ສາຂາ" : "Branches",
                items: [
                  _FooterLink(
                    icon: Icons.location_on_outlined,
                    label: isLao ? "ດົງໂດກ" : "Dongdok",
                  ),
                  _FooterLink(
                    icon: Icons.location_on_outlined,
                    label: isLao ? "ສະພານທອງ" : "Saphanthong",
                  ),
                  _FooterLink(
                    icon: Icons.location_on_outlined,
                    label: isLao ? "ແຄມຂອງ" : "Mekhong",
                  ),
                ],
              ),
            ),
            Expanded(
              child: _FooterColumn(
                title: isLao ? "ຕິດຕໍ່" : "Contact",
                items: [
                  _FooterLink(
                    icon: Icons.phone_outlined,
                    label: "020 55 395 558",
                    url: 'tel:+85655395558',
                  ),
                  _FooterLink(
                    icon: FontAwesomeIcons.facebookF,
                    label: "Facebook",
                    url: 'https://facebook.com/thebarberlao',
                    isFa: true,
                  ),
                  _FooterLink(
                    icon: FontAwesomeIcons.whatsapp,
                    label: "WhatsApp",
                    url: 'https://wa.me/85655395558',
                    isFa: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// ─── Footer Column ───────────────────────────────────────────────────────────

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _FooterColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.4,
          ),
        ),
        const SizedBox(height: 4),
        Container(
          width: 24,
          height: 2,
          decoration: BoxDecoration(
            color: const Color(0xFFD4A85A), // ✅ gold accent
            borderRadius: BorderRadius.circular(1),
          ),
        ),
        const SizedBox(height: 14),
        ...items,
      ],
    );
  }
}

// ─── Footer Link Item ─────────────────────────────────────────────────────────

class _FooterLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? url;
  final bool isFa;

  const _FooterLink({
    required this.icon,
    required this.label,
    this.url,
    this.isFa = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: url != null
            ? () async => await launchUrl(Uri.parse(url!))
            : null,
        child: Row(
          children: [
            SizedBox(
              width: 16,
              child: isFa
                  ? FaIcon(icon,
                  size: 12,
                  color: Colors.white.withOpacity(0.5))
                  : Icon(icon,
                  size: 14,
                  color: Colors.white.withOpacity(0.5)),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  color: url != null
                      ? Colors.white.withOpacity(0.75)
                      : Colors.white.withOpacity(0.5),
                  fontSize: 13,
                  height: 1.3,
                  decoration: url != null
                      ? TextDecoration.none
                      : null,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Social Row ──────────────────────────────────────────────────────────────

class _SocialRow extends StatelessWidget {
  final String facebookUrl;
  final String whatsappUrl;
  final String phoneUrl;

  const _SocialRow({
    required this.facebookUrl,
    required this.whatsappUrl,
    required this.phoneUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialBtn(
          icon: FontAwesomeIcons.facebookF,
          url: facebookUrl,
          color: const Color(0xFF1877F2),
        ),
        const SizedBox(width: 8),
        _SocialBtn(
          icon: FontAwesomeIcons.whatsapp,
          url: whatsappUrl,
          color: const Color(0xFF25D366),
        ),
        const SizedBox(width: 8),
        _SocialBtn(
          icon: FontAwesomeIcons.phone,
          url: phoneUrl,
          color: const Color(0xFF888888),
        ),
      ],
    );
  }
}

class _SocialBtn extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color color;

  const _SocialBtn({
    required this.icon,
    required this.url,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await launchUrl(Uri.parse(url)),
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Center(
          child: FaIcon(icon, size: 13, color: color),
        ),
      ),
    );
  }
}

// ─── Copyright ───────────────────────────────────────────────────────────────

class _CopyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "© ${DateTime.now().year} The Barber Lao. All rights reserved.",
      style: TextStyle(
        color: Colors.white.withOpacity(0.3),
        fontSize: 11,
      ),
    );
  }
}