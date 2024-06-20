// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/SliderModel.dart';

class SliderPromotionController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<SliderModel>> getAllSlider() async {
    List<SliderModel> listSlider = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection("SliderPromotion").orderBy("sort", descending: false).get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = snapshot.docs[i];
      SliderModel sliderModel = SliderModel.getModelFromJson(
        json: (documentSnapshot.data() as dynamic),
      );
      listSlider.add(sliderModel);
    }
    return listSlider;
  }
}

