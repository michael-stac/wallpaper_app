import 'package:flutter/material.dart';

import '../../../Utilis/routers.dart';
import 'add_wallpaper_page.dart';

class WallpaperHomePage extends StatefulWidget {
  const WallpaperHomePage({Key? key}) : super(key: key);

  @override
  State<WallpaperHomePage> createState() => _WallpaperHomePageState();
}

class _WallpaperHomePageState extends State<WallpaperHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("wallpaper"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          nextPage(context: context, page : const AddWallPaperPage());
        },
       label: Text("Upload"),


      ),
    );
  }
}
