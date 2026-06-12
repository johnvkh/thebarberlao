// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../ServicePage/ServicePageBase.dart';

class FemaleServicePage extends StatelessWidget {
  const FemaleServicePage({super.key});

  @override
  Widget build(BuildContext context) => const ServicePageBase(
    serviceType: "2",
    titleKey: 'SERVICE_WOMAN',
    accentColor: Color(0xFFE8A0BF), // pink
    router: "/FemaleService",
  );
}