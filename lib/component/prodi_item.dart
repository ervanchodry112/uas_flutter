import 'package:flutter/material.dart';
import 'package:proyek_uas/model/prodi_model.dart';
import 'package:proyek_uas/screen/mahasiswa.dart';

class ProdiItem extends StatefulWidget {
  final Prodi prodi;

  const ProdiItem({super.key, required this.prodi});
  @override
  State<ProdiItem> createState() => _ProdiItemState();
}

class _ProdiItemState extends State<ProdiItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
          leading: Image.asset('assets/logo_unila.png'),
          title: Text(widget.prodi.nama_prodi),
          subtitle: Text('Akreditasi: ${widget.prodi.akreditasi}'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Mahasiswa(
                id_prodi: widget.prodi.id_prodi,
              ),
            ));
          },
          selectedTileColor: Theme.of(context).primaryColor,
          hoverColor: Colors.blueAccent,

          // trailing: Text(widget.prodi.nama_prodi),
        ),
      ),
    );
  }
}
