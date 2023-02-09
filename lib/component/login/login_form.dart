import 'package:absensi/authentication/loginAut.dart';
import 'package:absensi/component/custom_surfix_icon.dart';
import 'package:absensi/component/default_button_custom_color.dart';
import 'package:absensi/component/login/login_guru.dart';
import 'package:absensi/screens/pages/dashboard_guru.dart';
import 'package:absensi/screens/register/Registrasi.dart';
import 'package:absensi/size_config.dart';
import 'package:absensi/utils/constans.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignInForm extends StatefulWidget {

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  final _formkey = GlobalKey<FormState>();
  String ? Email;
  String ? passwoard;
  bool ? remeber = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwoardController = TextEditingController();

  FocusNode focusNode = new FocusNode();

  Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildEmail(),
          // TextFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          // Row(
          //   children: [
          //     Checkbox(
          //         value: remeber,
          //         onChanged: (value) {
          //           setState(() {
          //             remeber = value;
          //          });
          //         }),
          //     Text('Tetap Masuk'),
          //     Spacer(),
          //     GestureDetector(
          //       onTap: () {},
          //       child: Text('Lupa Passwoard', style: TextStyle(decoration: TextDecoration.underline),
          //       ),
          //     ),
          //   ],
          // ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: 'Login',
            press: () async {
              User? user = await AuthLogin.loginUsingEmailPassword(email: _emailController.text, password: _passwoardController.text, context: context);
              print(user!.email);
              if (user != null){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardScreensSiswa()));
              }
            },
          ),
          SizedBox(height: 15,),
          ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text('Confirm'),
                    content: Text('Login Sebagai ?'),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreenGuru(),));
                          },
                          child: Text('guru'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('siswa'),
                      ),
                    ],
                  );
                });
              },
              child: Text('Pilih')),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreens.routeName);
            },
            child: Text('Belum punya akun? Daftar disini', style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField buildEmail() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Masukan Email Anda',
        labelStyle: TextStyle(color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      // keyboardType: TextInputType.text,
      controller: _passwoardController,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Passwoard',
        hintText: 'Masukan Passwoard Anda',
        labelStyle: TextStyle(color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }
}
