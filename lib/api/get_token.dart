import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetToken {
  static final ID = "948df317-78f7-4b92-a53f-0a56215e07de";
  static final USERNAME = "mhs-testing";
  static final PASSWORD = "unilajaya";

  static final URL = Uri.http("onedata.unila.ac.id", "api/live/0.1/auth/login");

  static Map<String, String> data = {
    'id_aplikasi': ID,
  };

  static void getToken(String username, String password) async {
    final sharedPref = await SharedPreferences.getInstance();

    data.addAll({
      'username': username,
      'password': password,
    });

    final response = await http.post(URL, body: data);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body.toString());
      print(json);
      if (json['status'] == true) {
        sharedPref.setString(
            "token", json['data']['type'] + json['data']['token']);
        AlertDialog(
          title: Text('Berhasil Mendapatkan Token'),
        );
      } else {
        AlertDialog(
          title: Text('Gagal Mendapatkan Token'),
        );
      }
    }
  }
}
