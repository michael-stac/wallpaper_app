import 'package:flutter/material.dart';

import 'BottomNavPages/WallpaperPage/all_wallpaper_page.dart';
import 'BottomNavPages/download_page.dart';
class MainActivityPage extends StatefulWidget {
  const MainActivityPage({Key? key}) : super(key: key);

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  List<Map> bottomNavItems = [
    {'icon' : Icons.home, 'title' : 'Home'},
    {'icon' : Icons.download, 'title' : 'Download'},
  ];
  List<Widget> bottomNavPages = [
    const WallpaperHomePage(),
    const DownloadHomePage(),


  ];
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        items: List.generate(bottomNavItems.length, (index) {
          final data = bottomNavItems[index];
          return BottomNavigationBarItem(icon: Icon(data['icon']), label: data['title'] );
        }),
      ),
      appBar: AppBar(),
      body: bottomNavPages[pageIndex],


    );
  }
}
