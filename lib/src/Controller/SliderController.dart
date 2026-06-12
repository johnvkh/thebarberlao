// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import '../Model/SliderModel.dart';

class SliderController {
  final _db = FirebaseFirestore.instance;

  Future<List<SliderModel>> getAllSlider() async {
    try {
      print("📡 [SliderController] Fetching Slider...");

      final snapshot = await _db
          .collection("Slider")
          .orderBy("sort", descending: false)
          .get();

      if (kDebugMode) {
        print("✅ [SliderController] docs found: ${snapshot.docs.length}");
        // ✅ print ທຸກ doc — ເຫັນ field ຈິງໃນ Firestore
        for (final doc in snapshot.docs) {
          print("   📄 doc id: ${doc.id}");
          print("   📄 doc data: ${doc.data()}");
        }
      }

      final list = snapshot.docs
          .map((doc) => SliderModel.getModelFromJson(json: doc.data()))
          .toList();

      if (kDebugMode) {
        for (final s in list) {
          print("   🖼️ sliderURL: ${s.sliderURL}");
        }
      }

      return list;

    } catch (e, stack) {
      // ✅ print error + stack trace — ເຫັນ error ຊັດ
      if (kDebugMode) {
        print("🔴 [SliderController] ERROR: $e");
        print("🔴 [SliderController] STACK: $stack");
      }
      return [];
    }
  }
}