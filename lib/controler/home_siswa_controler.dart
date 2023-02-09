import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeSiswaControler extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference siswa = firestore.collection('siswa');

    return siswa.get();
  }
}
