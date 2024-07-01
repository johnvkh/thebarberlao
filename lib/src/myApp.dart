// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thebarberlao/src/Screen/SplashScreen.dart';
import 'Layout/MyCustomScrollBehavior.dart';
import 'Localization/AppLocalization.dart';
import 'Localization/LanguageConstants.dart';
import 'Screen/ExtraService/ExtraServicePage.dart';
import 'Screen/FemaleService/FemaleServicePage.dart';
import 'Screen/Homepage/HomePage.dart';
import 'Screen/ImageManage/ImageServicePage.dart';
import 'Screen/MaleService/MaleServicePage.dart';
import 'Utility/Utils.dart';

final Map<String, WidgetBuilder> map = {
  '/splash': (BuildContext context) => const SplashScreen(),
  '/home': (BuildContext context) => const HomePage(),
  '/MaleService': (BuildContext context) => const MaleServicePage(),
  '/FemaleService': (BuildContext context) => const FemaleServicePage(),
  '/ExtraService': (BuildContext context) => const ExtraServicePage(),
};

String initialRoute = '/splash';
bool isFirstLaunch = true;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static Future<void> setLocale(BuildContext context, Locale newLocale) async {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'The Barber Lao',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Utils().backgroundColor,
      ),
      locale: _locale,
      supportedLocales: const [
        Locale("en", "US"),
        Locale("lo", "LA")
      ],
      localizationsDelegates: const [
        AppLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode &&
              supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      routes: map,
       initialRoute:  initialRoute,
    );
  }
}
