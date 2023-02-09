import 'package:absensi/firebase_options.dart';
import 'package:absensi/routes.dart';
import 'package:absensi/screens/login/login_screens.dart';
import 'package:absensi/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Absensi",
      theme: theme(),
      initialRoute: LoginScreens.routeName,
      routes: routes,
    )
  );
}

