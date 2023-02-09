import 'package:absensi/screens/pages/add_alumni.dart';
import 'package:absensi/screens/pages/dashboard_guru.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeGuru extends StatefulWidget {
  const HomeGuru({Key? key}) : super(key: key);

  @override
  State<HomeGuru> createState() => _HomeGuruState();
}

class _HomeGuruState extends State<HomeGuru> {
  CollectionReference siswa = FirebaseFirestore.instance.collection('siswa');

  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController angkatanController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreensSiswa()));
            }, icon: Icon(Icons.arrow_back_rounded)),
            Text('Data Alumni', style: TextStyle(color: Colors.black),),
            IconButton(onPressed: (){}, icon: Icon(Icons.access_time_filled_outlined)),
          ],
        ),
        // centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.arrow_back_rounded),
        //   ),
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.search),
        //   ),
        // ],
      ),


      body: Column(
        children: [
          Container(
            color: Colors.amber,
            width: 300,
            height: 300,
          ),
          Container(
            color: Colors.blue,
            width: 300,
            height: 300,
          )
        ],
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: siswa.snapshots(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       print(snapshot.data!.docs[0]['nama']);
      //       return Column(
      //         children: snapshot.data!.docs
      //             .map(
      //               (e) => Card(
      //             color: Colors.white60,
      //             child: ListTile(
      //               leading: CircleAvatar(
      //                 backgroundColor:
      //                 Color.fromARGB(255, 15, 15, 15),
      //                 foregroundColor:
      //                 Color.fromARGB(255, 203, 132, 39),
      //                 child: Text(e['nama'] ?? "A"),
      //               ),
      //               title: Text(e['nama'] ?? ""),
      //               subtitle: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     e['umur'],
      //                   ),
      //                   Text(
      //                     e['angkatan'],
      //                   ),
      //                 ],
      //               ),
      //               trailing: Row(
      //                 mainAxisSize: MainAxisSize.min,
      //                 children: [
      //                   IconButton(
      //                     icon: Icon(
      //                       Icons.edit,
      //                       color: Colors.green,
      //                     ),
      //                     onPressed: () {
      //                       // print("Masukkk");
      //                       namaController.text = e["nama"];
      //                       umurController.text = e["umur"];
      //                       angkatanController.text = e["angkatan"];
      //                       showDialog(
      //                           context: context,
      //                           builder: (context) => AlertDialog(
      //                             title: Form(
      //                               // key: _keyDialogForm,
      //                               child: Column(
      //                                 children: <Widget>[
      //                                   TextFormField(
      //                                     controller:
      //                                     namaController,
      //                                     decoration:
      //                                     const InputDecoration(
      //                                         icon: Icon(Icons
      //                                             .people),
      //                                         hintText:
      //                                         "Masukan nama"),
      //                                     // maxLength: 8,
      //                                     textAlign:
      //                                     TextAlign.start,
      //                                   ),
      //                                   SizedBox(height: 20,),
      //                                   TextFormField(
      //                                     controller:
      //                                     umurController,
      //                                     decoration:
      //                                     const InputDecoration(
      //                                         icon: Icon(Icons
      //                                             .perm_contact_cal),
      //                                         hintText:
      //                                         "Masukan Umur"),
      //                                     // maxLength: 8,
      //                                     textAlign:
      //                                     TextAlign.start,
      //                                   ),
      //                                   SizedBox(height: 20,),
      //                                   TextFormField(
      //                                     controller:
      //                                     angkatanController,
      //                                     decoration:
      //                                     const InputDecoration(
      //                                         icon: Icon(Icons
      //                                             .person),
      //                                         hintText:
      //                                         "Mausukan angkatan"),
      //                                     // maxLength: 8,
      //                                     textAlign:
      //                                     TextAlign.start,
      //                                   ),
      //                                   // TextFormField(
      //                                   //   controller:
      //                                   //   genderController,
      //                                   //   decoration:
      //                                   //   const InputDecoration(
      //                                   //       icon: Icon(
      //                                   //           Icons
      //                                   //               .man),
      //                                   //       hintText:
      //                                   //       "Input Your Gender"),
      //                                   //   // maxLength: 8,
      //                                   //   textAlign:
      //                                   //   TextAlign.start,
      //                                   //   onSaved: (val) {
      //                                   //     // titleController.text = val;
      //                                   //   },
      //                                   // ),
      //                                 ],
      //                               ),
      //                             ),
      //                             actions: [
      //                               IconButton(
      //                                 onPressed: () {
      //                                   siswa.doc(e.id).update(
      //                                     {
      //                                       'nama':
      //                                       namaController
      //                                           .text,
      //                                       'umur':
      //                                       umurController
      //                                           .text,
      //                                       'angkatan':
      //                                       angkatanController
      //                                           .text,
      //                                     },
      //                                   );
      //
      //                                   namaController.clear();
      //                                   umurController.clear();
      //                                   angkatanController
      //                                       .clear();
      //
      //                                   Navigator.of(context)
      //                                       .pop();
      //                                 },
      //                                 icon: const Icon(
      //                                   Icons.edit_attributes,
      //                                   color: Colors.green,
      //                                 ),
      //                               ),
      //                             ],
      //                           ));
      //                     },
      //                   ),
      //                   IconButton(
      //                     icon: Icon(
      //                       Icons.delete_outline,
      //                       color: Colors.red,
      //                     ),
      //                     onPressed: () {
      //                       showDialog(context: context, builder: (context) {
      //                         return AlertDialog(
      //                           title: Text('Konfirmasi'),
      //                           content: Text('Apakah anda ingin Menghapus'),
      //                           actions: [
      //                             ElevatedButton(
      //                               onPressed: () {
      //                                 siswa.doc(e.id).delete();
      //                                 Navigator.pop(context);
      //                               },
      //                               child: Text('Yes'),
      //                             ),
      //                             ElevatedButton(
      //                               onPressed: () {
      //                                 Navigator.pop(context);
      //                               },
      //                               child: Text('No'),
      //                             ),
      //                           ],
      //                         );
      //                       });
      //
      //                     },
      //                   ),
      //                 ],
      //               ),
      //             ),
      //           ),
      //         )
      //             .toList(),
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SiswaViews()));
        },
        child: Icon(Icons.add),

      ),

    );
  }
}
