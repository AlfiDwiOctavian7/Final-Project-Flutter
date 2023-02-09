import 'package:absensi/component/custom_surfix_icon.dart';
import 'package:absensi/screens/pages/add_alumni.dart';
import 'package:absensi/screens/pages/dashboard_siswa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewData extends StatelessWidget {
  // const ViewData({Key? key}) : super(key: key);

  @override
  CollectionReference siswa = FirebaseFirestore.instance.collection('siswa');

  final TextEditingController namaController = TextEditingController();
  final TextEditingController umurController = TextEditingController();
  final TextEditingController angkatanController =TextEditingController();
  final TextEditingController alamatController =TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreensGuru()));
            }, icon: Icon(Icons.arrow_back_rounded)),
            Text('Data Alumni', style: TextStyle(color: Colors.black),),
            IconButton(onPressed: (){}, icon: Icon(Icons.linked_camera_outlined)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: StreamBuilder<QuerySnapshot>(
          stream: siswa.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data!.docs[0]['nama']);
              return Column(
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
                              Icons.edit,
                              color: Colors.green,
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
                                            controller:
                                            namaController,
                                            decoration:
                                            const InputDecoration(
                                              labelText: 'Nama Lengkap',
                                                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/User.svg'),
                                                // icon: Icon(Icons
                                                //     .people),
                                                hintText:
                                                "Nama"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                            controller:
                                            umurController,
                                            decoration:
                                            const InputDecoration(
                                                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Check mark rounde.svg'),
                                              labelText: 'Umur',
                                                // icon: Icon(Icons
                                                //     .perm_contact_cal),
                                                hintText:
                                                "Umur"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                            controller:
                                            angkatanController,
                                            decoration:
                                            const InputDecoration(
                                                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/account_colored.svg'),
                                              labelText: 'Angkatan',
                                                // icon: Icon(Icons
                                                //     .person),
                                                hintText:
                                                "Angkatan"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
                                          SizedBox(height: 20,),
                                          TextFormField(
                                            controller:
                                            alamatController,
                                            decoration:
                                            const InputDecoration(
                                                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/location point.svg'),
                                                labelText: 'Email',
                                                // icon: Icon(Icons
                                                //     .person),
                                                hintText:
                                                "email"),
                                            // maxLength: 8,
                                            textAlign:
                                            TextAlign.start,
                                          ),
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
                                              'email':
                                              alamatController
                                                  .text,
                                            },
                                          );

                                          namaController.clear();
                                          umurController.clear();
                                          angkatanController
                                              .clear();
                                          alamatController.clear();

                                          Navigator.of(context)
                                              .pop();
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ));
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(context: context, builder: (context) {
                                return AlertDialog(
                                  title: Text('Confirm'),
                                  content: Text('Apakah anda ingin Menghapus'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        siswa.doc(e.id).delete();
                                        Navigator.pop(context);
                                      },
                                      child: Text('Yes'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('No'),
                                    ),
                                  ],
                                );
                              });

                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    .toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SiswaViews()));
      //   },
      //   child: Icon(Icons.add),
      //
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
