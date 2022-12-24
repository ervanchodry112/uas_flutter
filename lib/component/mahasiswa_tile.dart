import 'package:flutter/material.dart';
import 'package:proyek_uas/model/mahasiswa_model.dart';
import 'package:proyek_uas/model/mahasiswa_model.dart';
import 'package:proyek_uas/screen/mahasiswa.dart';

class MahasiswaTile extends StatefulWidget {
  final MahasiswaModel mhs;

  const MahasiswaTile({super.key, required this.mhs});
  @override
  State<MahasiswaTile> createState() => _MahasiswaTileState();
}

class _MahasiswaTileState extends State<MahasiswaTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
        // border: Border.all(
        //   color: Colors.grey.shade200,
        //   width: 1,
        // ),
      ),
      // ),
      child: ListTile(
        leading: Image.asset('assets/default-profile.png'),
        title: Text(widget.mhs.nama),
        subtitle: Text('${widget.mhs.npm}\n${widget.mhs.ipk}'),
        onTap: () {},
        isThreeLine: true,
        selectedTileColor: Theme.of(context).primaryColor,
        
        // trailing: Text(widget.mhs.nama_mhs),
      ),
    );
  }
}
