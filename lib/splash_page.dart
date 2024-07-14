import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preference/home_page.dart';
import 'package:shared_preference/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  static String  KEY_IS_LOGGED_IN ="IsLoggedIn";
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // static String  KEY_IS_LOGGED_IN ="IsLoggedIn";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
      Duration(seconds: 4),
            ()async {
              var pref = await SharedPreferences.getInstance();
              var check = pref.getBool(SplashPage.KEY_IS_LOGGED_IN) ?? false;

                if (check) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage(),));
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginPage(),));
                }

            }
        );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue ,
      appBar: AppBar(title: Text("Splash Page"),),
      body: Center(child: Icon(Icons.ac_unit,color: Colors.white,size: 80,)),

    );
  }
}
