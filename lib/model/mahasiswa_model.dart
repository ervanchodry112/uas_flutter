class MahasiswaModel {
  String id_peserta_didik;
  String npm;
  String nama;
  String prodi;
  String ipk;

  MahasiswaModel({
    required this.id_peserta_didik,
    required this.npm,
    required this.nama,
    required this.prodi,
    required this.ipk,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      id_peserta_didik: json['id_peserta_didik'],
      npm: json['NPM'],
      nama: json['nama_mahasiswa'],
      prodi: json['program_studi'],
      ipk: json['ipk'].toString(),
    );
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id_peserta_didik'] = this.id_peserta_didik;
    map['NPM'] = this.npm;
    map['nama_mahasiswa'] = this.nama;
    map['program_studi'] = this.prodi;
    map['ipk'] = this.ipk;
    return map;
  }
}
