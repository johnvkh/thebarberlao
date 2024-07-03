// ignore_for_file: file_names
//
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:pretty_qr_code/pretty_qr_code.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width * 0.5,
//           height: MediaQuery.of(context).size.height * 0.5,
//           child: PrettyQrView.data(
//             data: 'http://thebarberlao.com/',
//             decoration: const PrettyQrDecoration(
//               image: PrettyQrDecorationImage(
//                 fit: BoxFit.fitWidth,
//                 image: AssetImage('assets/images/LOGO01.png'),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Future<QuerySnapshot>? _futureQuerySnapshot;

  @override
  void initState() {
    super.initState();
    _futureQuerySnapshot = getUsersWithEqualCondition();
  }

  Future<QuerySnapshot> getUsersWithEqualCondition() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Categories').where('serviceType', isEqualTo: '1').orderBy('sort').get();

      return querySnapshot;
    } catch (e) {
      if (kDebugMode) {
        print("Error getting users: $e");
      }
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firestore Query Example'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: _futureQuerySnapshot,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No users found'));
          }

          var users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              var user = users[index];
              return ListTile(
                title: Text(user['categorieNameLA']),
                subtitle: Text('sort: ${user['sort']}'),
              );
            },
          );
        },
      ),
    );
  }
}

void main() async {
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
        measurementId: "G-P224QQ6KDV"),
  );
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}
