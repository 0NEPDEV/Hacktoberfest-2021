import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pubgwallpaper/wall_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return WallScreen();
      }));
    });
    // TODO: GET RANDOM IMAGES FROM API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image(
            image: AssetImage(
              "assets/splash.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: Text(
        //     "PUBG HD Wallpapers",
        //     style: TextStyle(
        //         fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
        //   ),
        // )
      ]),
    );
  }
}
