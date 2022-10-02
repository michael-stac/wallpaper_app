import 'package:flutter/material.dart';
import 'package:whatsapp_wallpaper/Utilis/routers.dart';

import 'Authentication/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      nextPageOnly(context: context, page: const AuthPage());
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
