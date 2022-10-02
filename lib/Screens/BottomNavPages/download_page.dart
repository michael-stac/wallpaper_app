import 'package:flutter/material.dart';

class DownloadHomePage extends StatefulWidget {
  const DownloadHomePage({Key? key}) : super(key: key);

  @override
  State<DownloadHomePage> createState() => _DownloadHomePageState();
}

class _DownloadHomePageState extends State<DownloadHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("download"),
      ),
    );
  }
}
