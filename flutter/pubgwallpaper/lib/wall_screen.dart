import 'package:flutter/material.dart';
import 'package:pubgwallpaper/app/models/wallpaper.dart';
import 'package:pubgwallpaper/app/modules/wallpaper.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import './fullscreen_wallpaper.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  List<WallPaper> wallpapers;
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    wallpapers = await wallPaperService.getAllWallPaper();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.white,
              ),
              onPressed: () {
                Share.share(
                    "Hi, You can download app from this link https://play.google.com/store/apps/details?id=com.neptechpal.csitentrance");
              }),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                showDialog(
                    context: (context),
                    builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            "PUBG Wallpapers",
                            textAlign: TextAlign.center,
                          ),
                          content: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 1, 1, 8.0),
                            child: Container(
                                height: 150,
                                width: 100,
                                child: Column(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          launch(
                                              "https://www.neptechpal.com/about-us/");
                                          print("tapped");
                                        },
                                        child: Center(child: Text("About Us"))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          LaunchReview.launch(
                                            androidAppId:
                                                "com.neptechpal.pubgwallpaper",
                                          );
                                          print("tapped");
                                        },
                                        child: Center(child: Text("Rate Us"))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          launch(
                                              "https://play.google.com/store/apps/developer?id=Neptechpal+pvt.+Ltd");
                                          print("tapped");
                                        },
                                        child:
                                            Center(child: Text("More Apps"))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          launch("https://www.neptechpal.com");
                                          print("tapped");
                                        },
                                        child: Center(child: Text("Website"))),
                                  ),
                                ])),
                          ),
                        ));
              })
        ],
        title: Text("PUBG Wallpaper"),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await init();
        },
        child: renderBody(),
      ),
    );
  }

  Widget renderBody() {
    if (wallpapers == null) {
      return Center(child: CircularProgressIndicator());
    }
    if (wallpapers.length == 0) {
      return Center(
        child: Text("No WallPaper Found"),
      );
    }
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      padding: EdgeInsets.all(8),
      itemCount: wallpapers.length,
      itemBuilder: (context, index) {
        String herotag = wallpapers[index].id;
        String imgpath = wallpapers[index].urls.small;
        return Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullScreenWallPaper(
                            imgpath: imgpath,
                            herotag: herotag,
                          )));
            },
            child: Hero(
                tag: herotag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: FadeInImage(
                    placeholder: AssetImage("assets/image.jpg"),
                    image: NetworkImage(imgpath),
                    fit: BoxFit.cover,
                  ),
                )),
          ),
        );
      },
      staggeredTileBuilder: (i) => StaggeredTile.count(2, i.isEven ? 2 : 3),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
