import 'package:flutter/material.dart';

import '../Provider/auth_provider.dart';
import '../Utilis/routers.dart';
import 'Authentication/auth_page.dart';
import 'BottomNavPages/WallpaperPage/all_wallpaper_page.dart';
import 'BottomNavPages/download_page.dart';


class MainActivityPage extends StatefulWidget {
  const MainActivityPage({Key? key}) : super(key: key);

  @override
  State<MainActivityPage> createState() => _MainActivityPageState();
}

class _MainActivityPageState extends State<MainActivityPage> {
  int pageIndex = 0;

  List<Map> bottomNavItems = [
    {'icon': Icons.home, 'title': 'Home'},
    {'icon': Icons.download, 'title': 'Download'}
  ];

  List<Widget> bottomNavPages = [
    const WallPaperHomePage(),
    const DownloadPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wall Paper App'),
        actions: [
          IconButton(
            onPressed: () {
              AuthenticationProvider().sigOut().then((value) {
                nextPageOnly(context: context, page: const AuthPage());
              });
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: bottomNavPages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          currentIndex: pageIndex,
          items: List.generate(bottomNavItems.length, (index) {
            final data = bottomNavItems[index];
            return BottomNavigationBarItem(
                icon: Icon(data['icon']), label: data['title']);
          })),
    );
  }
}