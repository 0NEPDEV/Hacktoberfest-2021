import 'package:flutter/material.dart';

import 'package:image_downloader/image_downloader.dart';
import 'package:share/share.dart';

class FullScreenWallPaper extends StatefulWidget {
  String herotag;
  String imgpath;

  FullScreenWallPaper({this.imgpath, this.herotag});

  @override
  _FullScreenWallPaperState createState() => _FullScreenWallPaperState();
}

class _FullScreenWallPaperState extends State<FullScreenWallPaper> {
  String _localfile;
  final LinearGradient backgroundgradient = LinearGradient(
      colors: [Color(0x10100000), Color(0x30000000)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  void saveImage() async {
    var url = widget.imgpath;

    await ImageDownloader.downloadImage(url); // saving image to the gallery
  }

  _onTapImage(BuildContext context, value) {
    return AlertDialog(
      title: Text(
          "This feature is not available in this version. Please download and set wallpaper manually."),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Okay"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.imgpath);
    return Scaffold(
      bottomNavigationBar: (Container(
        height: 60,
        child: Row(
          children: [
            MaterialButton(
              child: Text("Set Wallpaper"),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => _onTapImage(context, widget.imgpath));
              },
            ),
            MaterialButton(
              child: Text("Share"),
              onPressed: () {
                Share.share(
                    "Hi, You can download app from this link https://play.google.com/store/apps/details?id=com.neptechpal.csitentrance");
              },
            ),
            MaterialButton(
              child: Text("Download"),
              onPressed: () => {
                saveImage(),
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Image Saved in Gallery'),
                      actions: [
                        RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("Okay"),
                        )
                      ],
                    );
                  },
                )
              },
            )
          ],
        ),
      )),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: widget.herotag,
              child: Image.network(
                widget.imgpath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
