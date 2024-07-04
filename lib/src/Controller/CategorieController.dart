// ignore_for_file: file_names
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../Model/CategorieModel.dart';
import '../Utility/ResponseCode.dart';
import '../Utility/Utils.dart';

class CategorieController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<CategorieModel>> getCategorieByType({required String serviceType}) async {
    List<CategorieModel> listCategorie = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firebaseFirestore.collection("Categories").where("serviceType",isEqualTo: serviceType).get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = snapshot.docs[i];
      CategorieModel productModel = CategorieModel.getModelFromJson(
        json: (documentSnapshot.data() as dynamic),
      );
      listCategorie.add(productModel);
    }
    return listCategorie;
  }

}
