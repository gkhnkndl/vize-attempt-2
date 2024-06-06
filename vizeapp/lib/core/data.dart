import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class AppData {
  Future<Map<String, dynamic>> getSplashData() async {
    if(kIsWeb)
    {
      final data = await loadJsonFromAssets("assets/static/splash.json");
      return data;
    }
    final cacheData = await loadJsonFromCache("splash.json");
    if (cacheData != null) {
      return cacheData;
    } else {
      final data = await loadJsonFromAssets("assets/static/splash.json");
      return data;
    }
  }

  Future<Map<String, dynamic>> getProfileData() async {
     if(kIsWeb)
    {
      final data = await loadJsonFromAssets("assets/static/splash.json");
      return data;
    }
    final cacheData = await loadJsonFromCache("profile.json");
    if (cacheData != null) {
      return cacheData;
    } else {
      final data = await loadJsonFromAssets("assets/static/profile.json");
      return data;
    }
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<Map<String, dynamic>?> loadJsonFromCache(String filePath) async {
    final Directory appCacheDir = await getApplicationCacheDirectory();

    final file = File("${appCacheDir.path}/$filePath");
    if (file.existsSync()) {
      final fileData = await file.readAsString();

      return jsonDecode(fileData);
    } else {
      return null;
    }
  }

  saveStringToCache(String filePath, String data) async {
    final Directory appCacheDir = await getApplicationCacheDirectory();

    final file = File("${appCacheDir.path}/$filePath");
    await file.writeAsString(data, mode: FileMode.write);
  }

  saveMapToCache(String filePath, Map<String, dynamic> data) async {
    final Directory appCacheDir = await getApplicationCacheDirectory();

    final file = File("${appCacheDir.path}/$filePath");
    await file.writeAsString(jsonEncode(data), mode: FileMode.write);
  }
}
