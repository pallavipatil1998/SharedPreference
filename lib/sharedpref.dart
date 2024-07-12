import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends StatefulWidget {
  const SharedPref({super.key});

  @override
  State<SharedPref> createState() => _SharedPrefState();
}

class _SharedPrefState extends State<SharedPref> {

  var _nameController= TextEditingController();
  String? name;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getName();
  }

  void getName()async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    name= pref.getString("Name");
    setState(() {
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreference"),),
      body: Center(
        child: Column(
          children: [
            Text("Saved Name : ${name??"Default Name"} "),
            TextField(
              controller: _nameController,
            ),
            ElevatedButton(
                onPressed: ()async{
                  SharedPreferences pref= await SharedPreferences.getInstance();
                  pref.setString("Name", _nameController.text.toString());
                 /* name=_nameController.text.toString();
                  setState(() {

                  });*/

                  setState(() {

                  });

                },
                child: Text("Save")
            )
          ],
        ),
      ),
    );
  }
}
