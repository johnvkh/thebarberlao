// ignore_for_file: file_names
import 'dart:math';
import 'package:flutter/material.dart';

class Utils {
  Color blackColor = const Color(0xFF4a4747); //Yellow
  Color activeCyanColor = const Color(0xff0a7c97);
  Color backgroundColor = const Color(0xffebecee);

  showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: blackColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  String convertServiceType(String vaule) {
    String serviceType = "";
    if (vaule == "1") {
      serviceType = "ບໍລິການຊາຍ";
    } else if (vaule == "2") {
      serviceType = "ບໍລິການຍິງ";
    }
    return serviceType;
  }

  String convertStatus(String vaule) {
    String status = "";
    if (vaule == "1") {
      status = "ໃຊ້ງານ";
    } else if (vaule == "-1") {
      status = "ຍົກເລີກ";
    }
    return status;
  }

  String getUid() {
    return (100000 + Random().nextInt(10000)).toString();
  }

  int genarateImageName() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  int genarateCategorieId() {
    return DateTime.now().millisecondsSinceEpoch;
  }
}
