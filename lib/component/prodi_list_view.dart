import 'package:flutter/material.dart';
import 'package:proyek_uas/component/prodi_item.dart';
import 'package:proyek_uas/model/prodi_model.dart';

class ProdiList extends StatefulWidget {
  final List<Prodi> listProdi;
  const ProdiList({super.key, required this.listProdi});

  @override
  State<ProdiList> createState() => _ProdiListState();
}

class _ProdiListState extends State<ProdiList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
          top: 15,
        ),
        child: ListView.separated(
          itemCount: widget.listProdi.length,
          itemBuilder: (context, index) {
            print(widget.listProdi[index].toString());
            return ProdiItem(prodi: widget.listProdi[index]);
          },
          separatorBuilder: ((context, index) => const Divider()),
        ));
  }
}
