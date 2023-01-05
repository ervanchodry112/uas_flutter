import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GetToken {
  static final ID = "948df317-78f7-4b92-a53f-0a56215e07de";
  static final USERNAME = "mhs-testing";
  static final PASSWORD = "unilajaya";

  static final URL = Uri.http("onedata.unila.ac.id", "api/live/0.1/auth/login");
  static final CEK =
      Uri.http("onedata.unila.ac.id", "api/live/0.1/auth/cek_token");

  static Map<String, String> data = {
    'id_aplikasi': ID,
  };

  static Future<bool> getToken(String username, String password) async {
    final sharedPref = await SharedPreferences.getInstance();

    data.addAll({
      'username': username,
      'password': password,
    });

    final response = await http.post(URL, body: data);

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body.toString());
      if (json['status'] == true) {
        sharedPref.setString("token", json['data']['token_bearer']);
        print(json);
        return true;
      }
    }
    return false;
  }

  static void logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
  }

  static Future<bool> cekToken() async {
    final sharedPref = await SharedPreferences.getInstance();
    print(sharedPref.getString("token"));
    if (sharedPref.containsKey("token")) {
      final token = sharedPref.getString("token");
      final response = await http.post(CEK, body: {
        'token_bearer': token,
      });
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body.toString());
        print(json);
        if (json['status'] == true) {
          print(json['message']);
          return true;
        } else {
          sharedPref.remove('token');
          return false;
        }
      }
    }
    return false;
  }
}
