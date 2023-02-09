import 'package:absensi/component/login/login_form.dart';
import 'package:absensi/size_config.dart';
import 'package:absensi/utils/constans.dart';
import 'package:flutter/cupertino.dart';
// import 'package:simple_shadow/simple_shadow.dart';

class LoginComponent extends StatefulWidget {
  const LoginComponent({Key? key}) : super(key: key);

  @override
  State<LoginComponent> createState() => _LoginComponentState();
}

class _LoginComponentState extends State<LoginComponent> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Center(
                    child: Image.asset('assets/images/guruuu.png', height: 150, width: 220,),
                      // opacity: 0.5,
                      // color: kSecondaryColor,
                      // offset: Offset(5, 5),
                      // sigma: 2,
                    ),
                  Padding(padding: EdgeInsets.only(left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Login !", style: mTitleStyle,
                      ),
                    ],
                  ),
                  ),
                  SizedBox(height: 20,
                  ),
                   SignInForm()
                ],
              ),
            ),
          ),
        ),
    );
  }
}
