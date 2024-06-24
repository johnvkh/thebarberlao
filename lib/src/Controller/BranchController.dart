// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/BranchModel.dart';

class BranchController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<BranchModel>> getAllBranch() async {
    List<BranchModel> listBranch = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firebaseFirestore.collection("Branch").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = snapshot.docs[i];
      BranchModel branchModel = BranchModel.getModelFromJson(
        json: (documentSnapshot.data() as dynamic),
      );
      listBranch.add(branchModel);
    }
    return listBranch;
  }
}
