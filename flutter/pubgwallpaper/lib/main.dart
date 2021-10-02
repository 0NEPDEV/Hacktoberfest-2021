import 'package:flutter/material.dart';
import 'package:pubgwallpaper/splashscreen.dart';

import 'package:pubgwallpaper/wall_screen.dart';

void main() {
  runApp(MyApps());
}

class MyApps extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PUBG Wallpaper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
