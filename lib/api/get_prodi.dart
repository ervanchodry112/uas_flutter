import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:proyek_uas/api/get_token.dart';
import 'package:proyek_uas/model/prodi_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetProdi {
  static final URL = Uri.http(
    "onedata.unila.ac.id",
    "api/live/0.1/lembaga/profil_prodi/daftar",
    {'page': '1', 'sort_by': 'DESC', 'limit': '50'},
  );

  static Future<List<Prodi>> getProdi() async {
    final pref = await SharedPreferences.getInstance();
    if (await GetToken.cekToken()) {
      String? token = pref.getString('token');
      Map<String, String> head = {'Authorization': 'bearer$token'};

      final response = await http.get(
        URL,
        headers: head,
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body.toString());

        if (json['data'] != null) {
          final prodi = <Prodi>[];
          json['data'].forEach((v) {
            prodi.add(Prodi.fromJson(v));
            // print(v.toString());
          });
          return prodi;
        }
        return [];
      }
    } else {
      GetToken.logout();
    }
    return [];
  }
}
