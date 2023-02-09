
import 'package:absensi/screens/pages/dashboard_guru.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileGuru extends StatelessWidget {
  const ProfileGuru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _namaController = TextEditingController();
    final TextEditingController _angkatanController = TextEditingController();
    final TextEditingController _umurController = TextEditingController();
    final TextEditingController _alamatController = TextEditingController();

    CollectionReference siswa = FirebaseFirestore.instance.collection('siswa');
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("PROFILE"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, DashboardScreensSiswa.routeName);
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // COLUMN THAT WILL CONTAIN THE PROFILE
          Column(
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/teacher.png')
              ),
              SizedBox(height: 10),
              Text(
                "Siswa",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Senior Programmar")
            ],
          ),
          const SizedBox(height: 25),
          // Row(
          //   children: const [
          //     Padding(
          //       padding: EdgeInsets.only(right: 5),
          //       child: Text(
          //         "Complete your profile",
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //     Text(
          //       "(1/5)",
          //       style: TextStyle(
          //         color: Colors.blue,
          //       ),
          //     )
          //   ],
          // ),
          // const SizedBox(height: 10),
          // Row(
          //   children: List.generate(5, (index) {
          //     return Expanded(
          //       child: Container(
          //         height: 7,
          //         margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(10),
          //           color: index == 0 ? Colors.blue : Colors.black12,
          //         ),
          //       ),
          //     );
          //   }),
          // ),
          // const SizedBox(height: 10),
          // SizedBox(
          //   height: 180,
          //   child: ListView.separated(
          //     physics: const BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //     itemBuilder: (context, index) {
          //       final card = profileCompletionCards[index];
          //       return SizedBox(
          //         width: 160,
          //         child: Card(
          //           shadowColor: Colors.black12,
          //           child: Padding(
          //             padding: const EdgeInsets.all(15),
          //             child: Column(
          //               children: [
          //                 Icon(
          //                   card.icon,
          //                   size: 30,
          //                 ),
          //                 const SizedBox(height: 10),
          //                 Text(
          //                   card.title,
          //                   textAlign: TextAlign.center,
          //                 ),
          //                 const Spacer(),
          //                 ElevatedButton(
          //                   onPressed: () {},
          //                   style: ElevatedButton.styleFrom(
          //                     elevation: 0,
          //                     shape: RoundedRectangleBorder(
          //                         borderRadius: BorderRadius.circular(10)),
          //                   ),
          //                   child: Text(card.buttonText),
          //                 )
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //     separatorBuilder: (context, index) =>
          //     const Padding(padding: EdgeInsets.only(right: 5)),
          //     itemCount: profileCompletionCards.length,
          //   ),
          // ),
          SizedBox(height: 15,),

      FutureBuilder<DocumentSnapshot>(
      future: siswa.doc(user!.uid).get(),
      builder:
      (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

      if (snapshot.hasError) {
      return Text("Something went wrong");
      }

      if (snapshot.hasData && !snapshot.data!.exists) {
      return Text("Document does not exist");
      }

      if (snapshot.connectionState == ConnectionState.done) {
      Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
      _namaController.text = data["nama"];
      _emailController.text = data["email"];
      _umurController.text = data["umur"];
      _angkatanController.text = data["angkatan"];

      return Container();


      // Text("Full Name: ${data['full_name']} ${data['last_name']}");
    }

    return Text("loading");
    },
    ),
    Column(
    children: [
    TextFormField(
    controller: _namaController,
    decoration: const InputDecoration(
    // hintText: 'Masuka Nama',
    labelText: 'Nama Lengkap',
    ),
    onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
    },
    validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
    },
    ),

    SizedBox(height: 20,),
    TextFormField(
    controller: _emailController,
    decoration: const InputDecoration(
    // hintText: 'Masukan Email',
    labelText: 'Email',
    ),
    onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
    },
    validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
    },
    ),
    SizedBox(height: 20,),
    TextFormField(
    controller: _umurController,
    decoration: const InputDecoration(
    // hintText: 'Masukan Umur',
    labelText: 'Umur',
    ),
    onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
    },
    validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
    },
    ),
    SizedBox(height: 20,),
    TextFormField(
    controller: _angkatanController,
    decoration: const InputDecoration(
    // hintText: 'Angkatan ',
    labelText: 'Angkatan',
    ),
    onSaved: (String? value) {
    // This optional block of code can be used to run
    // code when the user saves the form.
    },
    validator: (String? value) {
    return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
    },
    ),
      SizedBox(height: 20,),
      TextFormField(
        controller: _alamatController,
        decoration: const InputDecoration(
          // hintText: 'Alamat ',
          labelText: 'Alamat',
        ),
        onSaved: (String? value) {
          // This optional block of code can be used to run
          // code when the user saves the form.
        },
        validator: (String? value) {
          return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
        },
      ),
    ],
    ),

    Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: ElevatedButton(onPressed: () {
              siswa.doc(user!.uid).update({
                "nama": _namaController.text,
                "umur": _umurController.text,
                "angkatan": _angkatanController.text,
                "email": _emailController.text,
                "alamat": _alamatController.text,
              });
            }, child: Text('Update')),
          ),
          //
          // const SizedBox(height: 35),
          // ...List.generate(
          //   customListTiles.length,
          //       (index) {
          //     final tile = customListTiles[index];
          //     return Padding(
          //       padding: const EdgeInsets.only(bottom: 5),
          //       child: Card(
          //         elevation: 4,
          //         shadowColor: Colors.black12,
          //         child: ListTile(
          //           leading: Icon(tile.icon),
          //           title: Text(tile.title),
          //           trailing: const Icon(Icons.chevron_right),
          //         ),
          //       ),
          //     );
          //   },
          // )
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 3,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.chat_bubble_2),
      //       label: "Messages",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.book),
      //       label: "Discover",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.person),
      //       label: "Profile",
      //     ),
      //   ],
      // ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

// List<CustomListTile> customListTiles = [
  // CustomListTile(
  //   icon: Icons.insights,
  //   title: "Activity",
  // ),
  // CustomListTile(
  //   icon: Icons.location_on_outlined,
  //   title: "Location",
  // ),
  // CustomListTile(
  //   title: "Notifications",
  //   icon: CupertinoIcons.bell,
  // ),
  // CustomListTile(
  //   title: "Logout",
  //   icon: CupertinoIcons.arrow_right_arrow_left,
  // ),
// ];