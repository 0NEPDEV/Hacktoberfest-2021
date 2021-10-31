import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pubgwallpaper/app/config/app_config.dart';
import 'package:pubgwallpaper/app/models/wallpaper.dart';

class _WallPaper {
  List<WallPaper> wallpapers;
  getAllWallPaper() async {
    var data = await http.get(Uri.parse(
        "https://api.unsplash.com/photos/?client_id=${AppConfig.unsplashClientId}"));
    List<dynamic> response = json.decode(data.body);
    return wallpapers = response.map((e) => WallPaper.fromJson(e)).toList();
  }
}

final _WallPaper wallPaperService = _WallPaper();
