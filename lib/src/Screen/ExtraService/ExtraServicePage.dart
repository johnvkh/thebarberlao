// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../ServicePage/ServicePageBase.dart';

class ExtraServicePage extends StatelessWidget {
  const ExtraServicePage({super.key});

  @override
  Widget build(BuildContext context) => const ServicePageBase(
    serviceType: "3",
    titleKey: 'ADDITIONAL_SERVICE',
    accentColor: Color(0xFF9B8BFF), // purple
    router: "/ExtraService",
  );
}