import 'package:absensi/screens/pages/data_alumi.dart';
import '../../controler/siswa.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SiswaViews extends  StatefulWidget {

  static String routeName = "/Tambah_Alumni";

  @override
  State<SiswaViews> createState() => _SiswaViewsState();
}
class _SiswaViewsState extends State<SiswaViews> {
  // final addSiswaControler = Get.find<AddSiswa>();
  final addSiswaControler = Get.put(AddSiswa());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeSiswa(),));
            }, icon: Icon(Icons.arrow_back_rounded)),
            Text('Tambah Alumni', style: TextStyle(color: Colors.black),),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25),
        child: Padding(
          padding: const EdgeInsets.only(right: 16, left: 16,),
          child: Column(
            children: [
              TextField(
                controller: addSiswaControler.nameC,
                autocorrect: false,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: "Nama",
                ),
              ),
              SizedBox(height: 23,),
              TextField(
                controller: addSiswaControler.ageC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Umur",
                ),
              ),
              SizedBox(height: 26,),
              TextField(
                controller: addSiswaControler.angkatanC,
                autocorrect: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  labelText: "Angkatan",
                ),
              ),
              SizedBox(height: 26,),
            ElevatedButton(onPressed: () {
              addSiswaControler.add(addSiswaControler.nameC.text, addSiswaControler.ageC.text, addSiswaControler.angkatanC.text);
              addSiswaControler.ageC.clear();
              addSiswaControler.nameC.clear();
              addSiswaControler.angkatanC.clear();
            },
                child: Text('Add Alumni'),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
