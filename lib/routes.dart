

import 'package:absensi/screens/login/login_screens.dart';
import 'package:absensi/screens/pages/add_alumni.dart';
import 'package:absensi/screens/pages/dashboard_guru.dart';
import 'package:absensi/screens/register/Registrasi.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginScreens.routeName: (context) => LoginScreens(),
  RegisterScreens.routeName: (context) => RegisterScreens(),
  DashboardScreensSiswa.routeName: (context) => DashboardScreensSiswa(),
  SiswaViews.routeName: (context) => SiswaViews(),
};