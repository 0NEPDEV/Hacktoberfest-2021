import 'package:flutter/material.dart';
import './wallpaperdata.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:launch_review/launch_review.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import './fullscreen_wallpaper.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
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
            // IconButton(
            //     icon: Icon(Icons.more),
            //     onPressed: () {
            //       print("popmenu tapped");
            //       Material(
            //         child: PopupMenuButton(
            //             itemBuilder: (_) => [
            //                   PopupMenuItem(
            //                       child: InkWell(
            //                           onTap: () {
            //                             print("about tapped");
            //                           },
            //                           child: Text("About Us"))),
            //                   PopupMenuItem(
            //                       child: InkWell(
            //                           onTap: () {
            //                             print("about tapped");
            //                           },
            //                           child: Text("About Us"))),
            //                   PopupMenuItem(
            //                       child: InkWell(
            //                           onTap: () {
            //                             print("about tapped");
            //                           },
            //                           child: Text("About Us")))
            //                 ]),
            //       );
            //     }),
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
                                          child:
                                              Center(child: Text("About Us"))),
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
                                          child:
                                              Center(child: Text("Rate Us"))),
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
                                            launch(
                                                "https://www.neptechpal.com");
                                            print("tapped");
                                          },
                                          child:
                                              Center(child: Text("Website"))),
                                    ),
                                  ])),
                            ),
                          ));
                })
          ],
          gradient: LinearGradient(colors: [Colors.red, Colors.purple]),
          title: Text("PUBG Wallpaper"),
          centerTitle: false,
        ),
        body: listofwallpapers != null
            ? new StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                padding: EdgeInsets.all(8),
                itemCount: listofwallpapers.length,
                itemBuilder: (context, i) {
                  String herotag = listofwallpapers[i]['tag'];
                  String imgpath =
                      listofwallpapers[i]['imgpath'] /*.data['url']*/;
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
                staggeredTileBuilder: (i) =>
                    StaggeredTile.count(2, i.isEven ? 2 : 3),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
