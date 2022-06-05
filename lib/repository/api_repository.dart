import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/constant/api_constant.dart';
import 'package:test/screens/home_page.dart';
import 'package:test/screens/login_page.dart';

/*
login crdential ,
email= eve.holt@reqres.in
password = cityslicka,


signup credential,
email= eve.holt@reqres.in
password = pistol,


*/

class ApiService extends ChangeNotifier {
  signIn({context, email, password}) async {
    var response = await http.post(Uri.parse(loginUrl), body: {
      "email": email,
      "password": password,
    });

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('LOGIN - SUCCESSFUL'),
          backgroundColor: Colors.green.shade300,
        ));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  signUp({context, email, password}) async {
    var response = await http.post(Uri.parse(registerUrl), body: {
      "email": email,
      "password": password,
    });
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('REGISTER-SUCCESSFUL'),
          backgroundColor: Colors.green.shade300,
        ));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }
}
