import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:proyek_uas/screen/home.dart';
import 'package:proyek_uas/screen/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menunggu selama 2 detik sebelum mengarah ke halaman selanjutnya
    Future.delayed(Duration(seconds: 20), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedSplashScreen(
        duration: 5000,
        splash: Image(
          image: AssetImage("assets/logo_unila.png"),
          width: 500,
        ),
        nextScreen: LoginPage(),
        splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: PageTransitionType.scale,
        backgroundColor: Colors.white,
      ),
    );
  }
}
