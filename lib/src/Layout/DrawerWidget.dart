// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Utility/Constants.dart';
import '../Utility/WidgetUtility.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget(
      {super.key, required this.isExpend, required this.selectedIndex});

  final bool isExpend;
  final int selectedIndex;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      selectedIndex = widget.selectedIndex;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      leading: !widget.isExpend
          ? Image.asset(
              "assets/images/natthirin.png",
              width: 50,
            )
          : TextWidget(
              "The Barber Lao",
              Colors.white,
              30,
              FontWeight.bold,
              TextAlign.center,
            ),
      extended: widget.isExpend,
      useIndicator: false,
      backgroundColor: const Color.fromRGBO(30, 30, 45, 1),
      unselectedIconTheme: const IconThemeData(color: Colors.white, opacity: 1),
      unselectedLabelTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      selectedIconTheme: const IconThemeData(color: kPrimaryColor, opacity: 1),
      destinations: [
        NavigationRailDestination(
          icon: const Icon(Icons.description),
          label: Text(
            "ຈັດການໝວດໝູ່ບໍລິການ",
            style: const TextStyle(fontFamily: 'roboto',fontSize: 16),
          ),
        ),
        const NavigationRailDestination(
          icon: Icon(Icons.folder_copy),
          label: Text(
            "ຈັດການຂໍ້ມູນຊ່າງ",
            style: TextStyle(fontFamily: 'roboto',fontSize: 16),
          ),
        ),

      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
          selectedIndex = value;
        });

        if (value == 0) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/CategorieManage', (route) => false);
        } else if (value == 1) {
          Navigator.pushNamedAndRemoveUntil(
              context, '/NormalBroadcast', (route) => false);
        }
      },
      selectedLabelTextStyle: const TextStyle(color: Colors.white),
    );
  }
}
