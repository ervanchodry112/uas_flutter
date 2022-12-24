import 'package:flutter/material.dart';
import 'package:proyek_uas/api/get_prodi.dart';
import 'package:proyek_uas/component/prodi_list_view.dart';
import 'package:proyek_uas/model/prodi_model.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // future: exploreService.getRecipes(),
      future: GetProdi.getProdi(),
      builder: (context, AsyncSnapshot<List<Prodi>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ProdiList(listProdi: snapshot.data ?? []);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
