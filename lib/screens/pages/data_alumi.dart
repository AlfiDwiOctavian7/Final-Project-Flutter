import 'package:absensi/screens/pages/add_alumni.dart';
import 'package:absensi/screens/pages/dashboard_guru.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeSiswa extends StatefulWidget {
  const HomeSiswa({Key? key}) : super(key: key);

  @override
  State<HomeSiswa> createState() => _HomeSiswaState();
}

class _HomeSiswaState extends State<HomeSiswa> {
  CollectionReference siswa = FirebaseFirestore.instance.collection('siswa');

  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController angkatanController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreensSiswa()));
            }, icon: Icon(Icons.arrow_back_rounded)),
            Text('Data Alumni', style: TextStyle(color: Colors.black),),
            IconButton(onPressed: (){}, icon: Icon(Icons.linked_camera_outlined),
            ),
          ],
        ),
      ),
      // body: FutureBuilder<QuerySnapshot<Object>>(
      //   future: FirebaseFirestore.instance.collection("siswa").get(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var listAllDoc = snapshot.data!.docs;
      //       return ListView.builder(
      //         itemCount: listAllDoc.length,
      //         itemBuilder: (context, index) => ListTile(
      //           onTap: ()
      //           {
      //             Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => EditDataViws()));
      //           },
      //           title: Text('${(listAllDoc[index].data() as Map<String, dynamic> ) ['nama']}'),
      //           subtitle: Text('Umur ${(listAllDoc[index].data() as Map<String, dynamic> ) ['umur']}'),
      //           trailing: IconButton(icon:
      //             Icon(Icons.delete),onPressed: () {
      //             siswa.doc().delete();
      //             },
      //           ),
      //         ),
      //
      //       );
      //     }
      //     return Center(child: CircularProgressIndicator(),);
      //   }
      // ),

      body: StreamBuilder<QuerySnapshot>(
        stream: siswa.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs[0]['nama']);
            return Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: Column(
                children: snapshot.data!.docs
                    .map(
                      (e) => Card(
                    color: Colors.white,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                        Color.fromARGB(255, 15, 15, 15),
                        foregroundColor:
                        Color.fromARGB(255, 203, 132, 39),
                        child: Text(e['nama'] == '' ? "A" : e['nama'][0].toUpperCase()),
                      ),
                      title: Text(e['nama'] ?? ""),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e['email'],
                          ),
                          // Text(
                          //   e['angkatan'],
                          // ),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              // print("Masukkk");
                              namaController.text = e["nama"];
                              umurController.text = e["umur"];
                              angkatanController.text = e["angkatan"];
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Form(
                                      // key: _keyDialogForm,
                                      child: Column(
                                        children: <Widget>[
                                          TextFormField(
                                            readOnly: true,
                                            controller:
                                            namaController,
                                            decoration:
                                            const InputDecoration(
                                                icon: Icon(Icons
                                                    .people),
                                                hintText:
                                                "Masukan nama"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                            readOnly: true,
                                            controller:
                                            umurController,
                                            decoration:
                                            const InputDecoration(
                                                icon: Icon(Icons
                                                    .perm_contact_cal),
                                                hintText:
                                                "Masukan Umur"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                            readOnly: true,
                                            controller:
                                            angkatanController,
                                            decoration:
                                            const InputDecoration(
                                                icon: Icon(Icons
                                                    .person),
                                                hintText:
                                                "Masukan angkatan"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
                                          // TextFormField(
                                          //   controller:
                                          //   genderController,
                                          //   decoration:
                                          //   const InputDecoration(
                                          //       icon: Icon(
                                          //           Icons
                                          //               .man),
                                          //       hintText:
                                          //       "Input Your Gender"),
                                          //   // maxLength: 8,
                                          //   textAlign:
                                          //   TextAlign.start,
                                          //   onSaved: (val) {
                                          //     // titleController.text = val;
                                          //   },
                                          // ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      IconButton(
                                        onPressed: () {
                                          siswa.doc(e.id).update(
                                            {
                                              'nama':
                                              namaController
                                                  .text,
                                              'umur':
                                              umurController
                                                  .text,
                                              'angkatan':
                                              angkatanController
                                                  .text,
                                            },
                                          );

                                          namaController.clear();
                                          umurController.clear();
                                          angkatanController
                                              .clear();

                                          Navigator.of(context)
                                              .pop();
                                        },
                                        icon: const Icon(
                                          Icons.edit_attributes,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          // IconButton(
                          //   icon: Icon(
                          //     Icons.delete_outline,
                          //     color: Colors.red,
                          //   ),
                          //   onPressed: () {
                          //     showDialog(context: context, builder: (context) {
                          //       return AlertDialog(
                          //         title: Text('Confirm'),
                          //         content: Text('Apakah anda ingin Menghapus'),
                          //         actions: [
                          //           ElevatedButton(
                          //               onPressed: () {
                          //                 siswa.doc(e.id).delete();
                          //                 Navigator.pop(context);
                          //               },
                          //               child: Text('Yes'),
                          //           ),
                          //           ElevatedButton(
                          //             onPressed: () {
                          //               Navigator.pop(context);
                          //             },
                          //             child: Text('No'),
                          //           ),
                          //         ],
                          //       );
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SiswaViews()));
      //   },
      //   child: Icon(Icons.add),
      //
      // ),

    );
  }
}
