// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../ServicePage/ServicePageBase.dart';

class MaleServicePage extends StatelessWidget {
  const MaleServicePage({super.key});

  @override
  Widget build(BuildContext context) => const ServicePageBase(
    serviceType: "1",
    titleKey: 'SERVICE_MAN',
    accentColor: Color(0xFFD4A85A), // gold
    router: "/MaleService",
  );
}