import 'dart:core';
import 'dart:convert';

class Prodi {
  String id_prodi;
  String nama_prodi;
  String sk_akred;
  String akreditasi;
  String? visi;
  String? misi;
  String? tujuan;
  String? sasaran;

  Prodi({
    required this.id_prodi,
    required this.nama_prodi,
    required this.sk_akred,
    required this.akreditasi,
    this.visi,
    this.misi,
    this.tujuan,
    this.sasaran,
  });

  factory Prodi.fromJson(Map<String, dynamic> json) {
    return Prodi(
      id_prodi: json['id_sms'] as String,
      nama_prodi: json['nm_prodi'] as String,
      sk_akred: json['sk_akreditasi_prodi'] as String,
      akreditasi: json['nm_akred'] as String,
      visi: json['visi'] as String,
      misi: json['misi'] as String,
      tujuan: json['tujuan'] as String,
      sasaran: json['sasaran'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id_sms'] = this.id_prodi;
    map['nm_prodi'] = this.nama_prodi;
    map['sk_akreditasi_prodi'] = this.sk_akred;
    map['nm_akred'] = this.akreditasi;
    map['visi'] = this.visi;
    map['misi'] = this.misi;
    map['tujuan'] = this.tujuan;
    map['sasaran'] = this.sasaran;

    return map;
  }
}
