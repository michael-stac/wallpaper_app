import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_wallpaper/Utilis/routers.dart';

import 'Authentication/auth_page.dart';
import 'BottomNavPages/WallpaperPage/all_wallpaper_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if(auth.currentUser == null ) {
        nextPageOnly(context: context, page: const AuthPage());
      }else {
        nextPage(context: context, page: const WallPaperHomePage());

      }

    });
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}
