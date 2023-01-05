import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:proyek_uas/api/get_token.dart';
import 'package:proyek_uas/model/mahasiswa_model.dart';
import 'package:proyek_uas/screen/mahasiswa.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetMahasiswa {
  static Future<List<MahasiswaModel>> getMahasiswa(String id_prodi) async {
    final URL = Uri.http(
      "onedata.unila.ac.id",
      "api/live/0.1/mahasiswa/list_mahasiswa",
      {
        'page': '1',
        'sort_by': 'DESC',
        'limit': '50',
        'id_prodi': id_prodi,
      },
    );
    final pref = await SharedPreferences.getInstance();
    if (await GetToken.cekToken()) {
      String? token = pref.getString('token');
      Map<String, String> head = {'Authorization': '$token'};

      final response = await http.get(
        URL,
        headers: head,
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body.toString());

        if (json['data'] != null) {
          final mhs = <MahasiswaModel>[];
          json['data'].forEach((v) {
            mhs.add(MahasiswaModel.fromJson(v));
            print(v.toString());
          });
          return mhs;
        }
        return [];
      }
    } else {
      GetToken.logout();
      Fluttertoast.showToast(
        msg: 'Token Expired, Silahkan Login Kembali',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red.shade600,
        textColor: Colors.white,
      );
    }
    return [];
  }
}
