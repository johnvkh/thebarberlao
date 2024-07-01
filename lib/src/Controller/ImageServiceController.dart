// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/ImageServiceModel.dart';

class ImageServiceController {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List<ImageServiceModel>> getImageServerByType({required String categorieName}) async {
    List<ImageServiceModel> listImageService = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
    await firebaseFirestore.collection("ImageService").where("categorieName",isEqualTo: categorieName).get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      DocumentSnapshot documentSnapshot = snapshot.docs[i];
      ImageServiceModel imageServiceModel = ImageServiceModel.getModelFromJson(
        json: (documentSnapshot.data() as dynamic),
      );
      listImageService.add(imageServiceModel);
    }
    return listImageService;
  }

}
