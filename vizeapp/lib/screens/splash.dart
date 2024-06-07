import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeapp/core/cache.dart';
import '../core/colortohex.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic> pageConfig = {};
  bool configLoaded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> _checkFirstLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstLaunch = prefs.getBool('isFirstLaunch');
    
    if (isFirstLaunch == null || isFirstLaunch) {
      // İlk açılış
      await prefs.setBool('isFirstLaunch', false);
      context.go('/boarding');
    } else {
      // Sonraki açılışlar
      context.go('/home');
    }
  }

  Future<void> loadData() async {
    // Memory read
    CacheSystem cs = CacheSystem();
    pageConfig = await cs.getSplashConfig();

    setState(() {
      this.pageConfig = pageConfig;
      configLoaded = true;
    });

    // Check first launch after the splash screen duration
    Future.delayed(Duration(seconds: pageConfig["duration"]), () {
      _checkFirstLaunch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return !configLoaded
        ? const SizedBox()
        : Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: pageConfig["backgroundColor"].isNotEmpty
                      ? HexColor(pageConfig["backgroundColor"])
                      : null,
                ),
                child: Stack(
                  children: [
                    if (pageConfig["background"].isNotEmpty)
                      SizedBox.expand(
                        child: Image.network(pageConfig["background"],
                            fit: BoxFit.cover),
                      ),
                    if (pageConfig["logo"].isNotEmpty)
                    Center(
                        child: Image.asset(
                      pageConfig["logo"],
                      width: 300,
                    )),
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 95),
                          child: CircularProgressIndicator(),
                        )),
                  ],
                ),
              ),
            ),
          );
  }
}