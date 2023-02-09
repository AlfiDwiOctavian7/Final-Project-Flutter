import 'package:absensi/screens/login/login_screens.dart';
import 'package:absensi/screens/pages/data_alumi.dart';
import 'package:absensi/screens/pages/location.dart';
import 'package:absensi/screens/pages/profile_guru.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardScreensSiswa extends StatefulWidget {
  const DashboardScreensSiswa({Key? key}) : super(key: key);

  static String routeName = "/dashboard";

  @override
  State<DashboardScreensSiswa> createState() => _DashboardScreensSiswaState();
}

class _DashboardScreensSiswaState extends State<DashboardScreensSiswa> {

  void logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Card makeDashboardItem(String title, String img, int index) {

    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: Container(
        decoration: index == 0 || index == 3 || index == 4
            ? BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Color(0xFF004B8D),
              Color(0xFFffffff),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        )
            : BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          gradient: const LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(3.0, -1.0),
            colors: [
              Colors.cyan,
              Colors.amber,
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 3,
              offset: Offset(2, 2),
            )
          ],
        ),
        child: InkWell(
          onTap: () {
            if (index == 0) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeSiswa()));
              //1.item
            }
            if (index == 1) {

              //2.item
            }
            if (index == 2) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LocationViws()));
              //3.item
            }
            if (index == 3) {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfileGuru()));
              //4.item
            }
            if (index == 4)  {
              //5.item
            }
            if (index == 5)  {
              showDialog(context: context, builder: (context) {
                return AlertDialog(
                  title: Text('Confirm'),
                  content: Text('Apakah anda ingin keluar ?'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreens()));
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
              // Navigator.push(context, MaterialPageRoute(builder: (context){return SignInForm();}),);
              // logOut();

              // FirebaseAuth.instance.signOut();
              //5.item
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: [
              const SizedBox(height: 50),
              Center(
                child: Image.asset(
                  img,
                  height: 50,
                  width: 50,
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 19,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                // AppBar(
                //   leading: Icon(Icons.home),
                //   title: new Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: <Widget> [
                //       Text('Dashboard', style: TextStyle(color: Colors.white),),
                //       InkWell(
                //         child: Container(
                //           child: new Row(
                //             children: <Widget> [
                //               new Container(
                //                   height: 28.0,
                //                   width: 28.0,
                //                   padding: EdgeInsets.all(6.0),
                //                   decoration: new BoxDecoration(
                //                     borderRadius: new BorderRadius.all(new Radius.circular(100.0),
                //                     ),
                //                     color: Colors.white,
                //                   ),
                //                   alignment: Alignment.centerRight,
                //                   child: new Icon( Icons.person, color: Colors.blue, size: 16.0,)
                //               )
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.menu_rounded, size: 30, color: Colors.black87,
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                     Padding(
                         padding: EdgeInsets.only(top: 3, left: 3, bottom: 15),
                       child: Text(
                         'Halo Halo !!!',
                         style: TextStyle(
                             fontSize: 30,
                             fontWeight: FontWeight.w600,
                             letterSpacing: 1,
                             wordSpacing: 2,
                            color: Colors.black87
                         ),
                       ),
                     ),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(1)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search here!!!',
                            hintStyle: TextStyle(
                              color: Colors.black87.withOpacity(0.5),
                            ),
                              prefixIcon: Icon(Icons.search, size: 22,)
                          ),
                        ),
                      ),
                      // Text(
                      //   "Welcome Home shirshir",
                      //   style:
                      //   TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      // ),
                      // SizedBox(height: 4),
                      // Text(
                      //   "Items:",
                      //   style:
                      //   TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(2),
              children: [
                makeDashboardItem("Alumni", "assets/images/students.png", 0),
                makeDashboardItem("Event", "assets/images/festival.png", 1),
                makeDashboardItem("Location", "assets/images/map.png", 2),
                makeDashboardItem("Profile", "assets/images/profile.png", 3),
                makeDashboardItem("Settings", "assets/images/setting.png", 4),
                makeDashboardItem("Log Out", "assets/images/exit.png", 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
