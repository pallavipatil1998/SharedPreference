import 'package:flutter/material.dart';
import 'package:shared_preference/home_page.dart';
import 'package:shared_preference/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController =TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Page"),),
      body: Column(
        children: [
          Text("Welcome"),
          SizedBox(height: 25,),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Enter Email_id",
              label: Text("Email_id"),
              border: OutlineInputBorder( borderRadius:BorderRadius.circular(2))
            ),
          ),
          SizedBox(height: 15,),
          TextField(
            controller: passController,
            decoration: InputDecoration(
              hintText: "Enter Password",
                label: Text("Password"),
                border: OutlineInputBorder( borderRadius:BorderRadius.circular(2))
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
              onPressed: ()async{
                var pref= await SharedPreferences.getInstance();
                pref.setBool(SplashPage.KEY_IS_LOGGED_IN,true);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));

              },
              child:Text("Login",style: TextStyle(fontSize: 15),)
          )

        ],
      ),
    );
  }
}
