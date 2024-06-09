import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thebarberlao/src/myApp.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAaxiKI9TkcExqYPmjfMen-DIYfPiJZgHw",
        authDomain: "thebarberlao-86aaf.firebaseapp.com",
        databaseURL: "https://thebarberlao-86aaf-default-rtdb.asia-southeast1.firebasedatabase.app",
        projectId: "thebarberlao-86aaf",
        storageBucket: "thebarberlao-86aaf.appspot.com",
        messagingSenderId: "820422310534",
        appId: "1:820422310534:web:b2e3ff91e1772d26312f07",
        measurementId: "G-P224QQ6KDV"
    ),
  );
  //GoogleMapsFlutterWeb.registerWith(Registrar());
  runApp(const MyApp());
}
