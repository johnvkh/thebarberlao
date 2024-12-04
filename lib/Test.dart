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
//             data: 'https://maps.app.goo.gl/Jcg77ki55gWfNtDe7?g_st=com.google.maps.preview.copy',
//             // decoration: const PrettyQrDecoration(
//             //   image: PrettyQrDecorationImage(
//             //     fit: BoxFit.fitWidth,
//             //     image: AssetImage('assets/images/LOGO01.png'),
//             //   ),
//             // ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expandable Text Example with Expanded'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpandableTextWidget(
            text:
            'This is a long piece of text that is initially collapsed. Clicking "Read More" will expand it to show the full text. You can control how many lines are visible before the user clicks "Read More".',
          ),
        ),
      ),
    );
  }
}

class ExpandableTextWidget extends StatefulWidget {
  final String text;

  ExpandableTextWidget({required this.text});

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  bool _isExpanded = false; // Track whether the text is expanded or not
  final int _initialMaxLines = 2; // Number of lines to show initially

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Wrapping the Text widget inside a Flexible to handle expansion
        Flexible(
          child: Text(
            widget.text,
            overflow: TextOverflow.fade,
            style: TextStyle(fontSize: 16.0),
            maxLines: _isExpanded ? null : _initialMaxLines,
          ),
        ),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Read Less' : 'Read More',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

