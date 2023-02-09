import 'package:absensi/component/login/login_component.dart';
import 'package:absensi/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({Key? key}) : super(key: key);

  static String routeName = "/sing_in";

  Future<FirebaseApp> _initilizeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: LoginComponent()
      // body: FutureBuilder(
      //   future: _initilizeFirebase(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       return LoginComponent();
      //     }
      //     return const Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   }
      // ),
    );
  }
}
