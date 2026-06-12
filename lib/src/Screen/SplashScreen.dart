// ignore_for_file: file_names

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  );

  late final Animation<double> _fade = CurvedAnimation(
    parent: _ctrl,
    curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
  );

  late final Animation<double> _scale = Tween<double>(
    begin: 0.85,
    end: 1.0,
  ).animate(CurvedAnimation(
    parent: _ctrl,
    curve: const Interval(0.0, 0.65, curve: Curves.easeOut),
  ));

  @override
  void initState() {
    super.initState();
    // ✅ ໄວຂຶ້ນ — animation 1.4s ແທນ delay 3s
    _ctrl.forward().then((_) {
      if (!mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context, '/home', (route) => false,
      );
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/white_bg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: FadeTransition(
          opacity: _fade,
          child: ScaleTransition(
            scale: _scale,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ✅ Image.asset ໂດຍກົງ — ໄວກວ່າ Container+BoxDecoration
                  Image.asset(
                    'assets/images/LOGO03.png',
                    width: 250,
                    height: 70,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "THE BAR-BER LAO",
                    style: TextStyle(
                      fontSize: 45,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Anton',
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}