import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thebarberlao/src/Screen/ExtraService/ExtraServicePage.dart';
import 'package:thebarberlao/src/Screen/FemaleService/FemaleServicePage.dart';
import 'package:thebarberlao/src/Screen/Homepage/HomePage.dart';
import 'package:thebarberlao/src/Screen/MaleService/MaleServicePage.dart';
import 'package:thebarberlao/src/Screen/SplashScreen.dart';
import 'package:thebarberlao/src/Utility/AppColors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/Localization/AppLocalization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:            "AIzaSyAaxiKI9TkcExqYPmjfMen-DIYfPiJZgHw",
      authDomain:        "thebarberlao-86aaf.firebaseapp.com",
      databaseURL:       "https://thebarberlao-86aaf-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId:         "thebarberlao-86aaf",
      storageBucket:     "thebarberlao-86aaf.appspot.com",
      messagingSenderId: "820422310534",
      appId:             "1:820422310534:web:b2e3ff91e1772d26312f07",
      measurementId:     "G-P224QQ6KDV",
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor:          Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(const BarberLaoApp());
}

class BarberLaoApp extends StatelessWidget {
  const BarberLaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Barber Lao',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,

      // ─── i18n ─────────────────────────────────────────────────
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('lo', 'LA'),
      ],

      initialRoute: '/',

      // ✅ ທຸກ routes ຢູ່ບ່ອນດຽວ — ບໍ່ conflict
      routes: {
        '/':             (_) => const SplashScreen(),
        '/home':         (_) => const HomePage(),
        '/MaleService':  (_) => const MaleServicePage(),
        '/FemaleService':(_) => const FemaleServicePage(),
        '/ExtraService': (_) => const ExtraServicePage(),
      },

      // ✅ Fade transition ສໍາລັບທຸກ route
      onGenerateRoute: (settings) {
        final builder = {
          '/':             (_) => const SplashScreen(),
          '/home':         (_) => const HomePage(),
          '/MaleService':  (_) => const MaleServicePage(),
          '/FemaleService':(_) => const FemaleServicePage(),
          '/ExtraService': (_) => const ExtraServicePage(),
        }[settings.name];

        if (builder == null) return null;

        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (ctx, __, ___) => builder(ctx),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
          transitionDuration: const Duration(milliseconds: 250),
        );
      },
    );
  }
}