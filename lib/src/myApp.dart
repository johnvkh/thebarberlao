// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'Layout/MyCustomScrollBehavior.dart';
import 'Screen/Homepage/HomePage.dart';
import 'Utility/Utils.dart';

final Map<String, WidgetBuilder> map = {
  '/homepage': (BuildContext context) => const HomePage(),
};

String initialRoute = '/signin';
String categorieManage = '/CategorieManage';
bool isFirstLaunch = true;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'The Barber Lao',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Utils().backgroundColor,
      ),
      routes: map,
       initialRoute:  initialRoute,
    );
  }
}
