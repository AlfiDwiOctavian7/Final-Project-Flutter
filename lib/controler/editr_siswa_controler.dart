import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';


class EditSiswa extends GetxController{
  late TextEditingController nameC;
  late TextEditingController ageC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void editSiswa(String name, String age) async {
    CollectionReference siswa = firestore.collection('siswa');

    try{
      await siswa.add({
        "nama" : name,
        "umur" : age,
      });

      Get.defaultDialog(
          title: 'Berhasil',
          middleText: 'Berhasil menambahkan data',
          onConfirm: () {
            nameC.clear();
            ageC.clear();
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

    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    ageC.dispose();
    super.onClose();
  }
}