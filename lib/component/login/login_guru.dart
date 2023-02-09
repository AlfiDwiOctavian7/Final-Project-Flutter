
import 'package:absensi/authentication/loginAut.dart';
import 'package:absensi/component/custom_surfix_icon.dart';
import 'package:absensi/screens/pages/dashboard_siswa.dart';
import 'package:absensi/screens/register/Registrasi_guru.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginScreenGuru extends StatefulWidget {
  @override
  State<LoginScreenGuru> createState() => _LoginScreenGuruState();
}

class _LoginScreenGuruState extends State<LoginScreenGuru> {

  final _formkey = GlobalKey<FormState>();
  String ? Email;
  String ? passwoard;
  bool ? remeber = false;

  TextEditingController _emailControllerGuru = TextEditingController();
  TextEditingController _passwoardControllerGuru = TextEditingController();


  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: Container(
      //   padding: EdgeInsets.all(20.0),
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextField(
      //         decoration: InputDecoration(labelText: "Username"),
      //       ),
      //       SizedBox(height: 20.0),
      //       TextField(
      //         decoration: InputDecoration(labelText: "Password"),
      //         obscureText: true,
      //       ),
      //       SizedBox(height: 20.0),
      //       ElevatedButton(
      //         onPressed: () {},
      //         child: Text("Login"),
      //       ),
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Column(
              children: [
                Image.asset('assets/images/guru.jpg'),
              ],
            ),
            SizedBox(height: 10,
            ),
            TextField(
              controller: _emailControllerGuru,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Email',
                border: OutlineInputBorder(),
                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/User.svg'),
              ),
            ),
            SizedBox(height: 20,
            ),
            TextField(
              autocorrect: false,
              controller: _passwoardControllerGuru,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Passwoard',
                hintText: 'Passwoard',
                border: OutlineInputBorder(),
                suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
              ),
            ),
            SizedBox(height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = await AuthLogin.loginUsingEmailPassword(email: _emailControllerGuru.text, password: _passwoardControllerGuru.text, context: context);
                print(user!.email);
                if (user != null){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreensGuru()));
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 15,),
            // ElevatedButton(
            //     onPressed: () {
            //       showDialog(context: context, builder: (context){
            //         return AlertDialog(
            //           title: Text('Confirm'),
            //           content: Text('Login Sebagai ?'),
            //           actions: [
            //             ElevatedButton(
            //               onPressed: () {
            //                 Navigator.pop(context);
            //               },
            //               child: Text('guru'),
            //             ),
            //             ElevatedButton(
            //               onPressed: () {
            //                 Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInForm()));
            //               },
            //               child: Text('siswa'),
            //             ),
            //           ],
            //         );
            //       });
            //     },
            //     child: Text('Pilih')),
            // SizedBox(height: 20,),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => RegisterScreensGuru()));
                },
                child: Text('Belum punya akun? Daftar disini', style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
