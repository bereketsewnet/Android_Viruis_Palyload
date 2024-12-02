import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'android_permission.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  void getPermission() async {
    final AndroidPermission permission = Get.put(AndroidPermission());
    await permission.requestAllPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: WebView(
          // this is for add you want website
          initialUrl: 'https://www.dailymotion.com/us',
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
