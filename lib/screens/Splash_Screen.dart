import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Login_screen.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(

        context,  MaterialPageRoute(builder: (context) => LoginPage()),
      );

    }
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 400,
          child: Lottie.asset("assets/animie/animies.json"),
        ),
      ),

    );
  }
}
