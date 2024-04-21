import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    final firstLaunch = await storage.isFirtsLaunch();

    if (firstLaunch) {
      //boarding
      GoRouter.of(context).replace("/boarding");

      await storage.setConfig(language: getDeviceLanguage());
    } else {
      //ana ekran
      final config = await storage.getConfig();

      if (config["language"] == null) {
        storage.setConfig(language: getDeviceLanguage());
      }
      GoRouter.of(context).replace("/home");
    }
  }

  getDeviceLanguage() {
    // varsayilan dil erisimi
    final String defaultLocale;
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }
    final langParts = defaultLocale.split("_");
    final supportedLang = ["en", "tr"];
    final String finalLang;

    if (supportedLang.contains(langParts[0])) {
      finalLang = langParts[0];
    } else {
      finalLang = "en";
    }

    return finalLang;
  }

  
  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    ));
  }
}
