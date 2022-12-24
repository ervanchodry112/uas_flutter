import 'package:flutter/material.dart';
import 'package:proyek_uas/component/mahasiswa_tile.dart';
import 'package:proyek_uas/model/mahasiswa_model.dart';

class MahasiswaList extends StatefulWidget {
  List<MahasiswaModel> mhsList;
  MahasiswaList({super.key, required this.mhsList});

  @override
  State<MahasiswaList> createState() => _MahasiswaListState();
}

class _MahasiswaListState extends State<MahasiswaList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: ListView.separated(
          itemCount: widget.mhsList.length,
          itemBuilder: (context, index) {
            print(widget.mhsList[index].toString());
            return MahasiswaTile(mhs: widget.mhsList[index]);
          },
          separatorBuilder: ((context, index) => const Divider()),
        ));
  }
}
