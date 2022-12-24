import 'dart:core';
import 'dart:convert';

class Prodi {
  String id_prodi;
  String nama_prodi;
  String akreditasi;

  Prodi({
    required this.id_prodi,
    required this.nama_prodi,
    required this.akreditasi,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) {
    return Prodi(
      id_prodi: json['id_sms'],
      nama_prodi: json['nm_prodi'],
      akreditasi: json['nm_akred'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id_sms'] = this.id_prodi;
    map['nm_prodi'] = this.nama_prodi;
    map['nm_akred'] = this.akreditasi;
    return map;
  }
}
