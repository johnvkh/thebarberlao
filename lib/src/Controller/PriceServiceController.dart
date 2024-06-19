// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/PriceServiceModel.dart';

class PriceServiceController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<PriceServiceModel>> getAllPriceService() async {
    List<PriceServiceModel> listPriceService = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection("PriceService").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = snapshot.docs[i];
      PriceServiceModel priceServiceModel = PriceServiceModel.getModelFromJson(
        json: (documentSnapshot.data() as dynamic),
      );
      listPriceService.add(priceServiceModel);
    }
    return listPriceService;
  }
}
