// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/BarberModel.dart';

class BarberController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<BarberModel>> getAllBarber() async {
    List<BarberModel> listBarber = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection("Barber").orderBy("branchID", descending: true).get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = snapshot.docs[i];
      BarberModel barberModel = BarberModel.getModelFromJson(
        json: (documentSnapshot.data() as dynamic),
      );
      listBarber.add(barberModel);
    }
    return listBarber;
  }
}
