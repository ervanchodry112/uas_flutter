import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:proyek_uas/api/get_token.dart';
import 'package:proyek_uas/screen/screen_1.dart';
import 'package:proyek_uas/screen/screen_2.dart';
import 'package:proyek_uas/screen/screen_3.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One Data Unila"),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          FirstScreen(),
          SecondScreen(),
          ThirdScreen(),
        ],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: _selectedIndex,
        activeColor: Theme.of(context).primaryColor,
        icons: const <IconData>[
          Icons.home,
          Icons.phone,
          // Icons.people,
          Icons.person,
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          // GetToken.getToken();
        },
        gapLocation: GapLocation.none,

        // gapLocation: GapLocation.center,
      ),
    );
  }
}
