import 'package:flutter/material.dart';
import 'package:proyek_uas/api/get_mahasiswa.dart';
import 'package:proyek_uas/component/mahasiswa_list.dart';
import 'package:proyek_uas/model/mahasiswa_model.dart';

class Mahasiswa extends StatefulWidget {
  String id_prodi;

  Mahasiswa({super.key, required this.id_prodi});

  @override
  _MahasiswaState createState() => _MahasiswaState();
}

class _MahasiswaState extends State<Mahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Mahasiswa'),
        ),
        body: FutureBuilder(
          future: GetMahasiswa.getMahasiswa(widget.id_prodi),
          builder: (context, AsyncSnapshot<List<MahasiswaModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MahasiswaList(mhsList: snapshot.data ?? []);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
