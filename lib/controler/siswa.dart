import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddSiswa extends GetxController{

  late TextEditingController nameC;
  late TextEditingController ageC;
  late TextEditingController angkatanC;
  late TextEditingController alamatC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void add(String name, String age, String angkatan) async {
    CollectionReference siswa = firestore.collection('siswa');

    try{
      await siswa.add({
        "nama" : name,
        "umur" : age,
        "angkatan" : angkatan,
        "alamat" : alamatC
      });

      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Berhasil menambahkan data',
          onConfirm: () {
            nameC.clear();
            ageC.clear();
            angkatanC.clear();
            alamatC.clear();
            Get.back();
            Get.back();
          },
          textConfirm: "Okay"
      );

    } catch(e) {

      print(e);
      Get.defaultDialog(
          title: 'Terjadi kesalahan',
          middleText: 'Tidak Berhasil menambahkan data',
          // onConfirm: () => Get.back(),
          // textConfirm: "Okay"
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    ageC = TextEditingController();
    angkatanC = TextEditingController();
    alamatC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    ageC.dispose();
    angkatanC.dispose();
    alamatC.dispose();
    super.onClose();
  }
}