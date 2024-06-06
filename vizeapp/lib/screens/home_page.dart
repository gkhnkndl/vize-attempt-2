import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vizeapp/components/bottom_nav_bar.dart';
import 'package:vizeapp/models/profileItem.dart';
import 'package:vizeapp/screens/adress_page.dart';
import 'package:vizeapp/screens/cart_page.dart';
import 'package:vizeapp/screens/payment_page.dart';
import 'package:vizeapp/screens/gemini_chat.dart';
import 'package:vizeapp/screens/shop_page.dart';
import 'package:vizeapp/screens/todopage.dart';
import 'package:vizeapp/services/api.dart';

import '../core/data.dart';
import '../core/localization.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //this selected index is to control the bottom nav bar
  int _selectedIndex = 0;
  // this method will update our selected index when user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }  

  String temp = "";
  syncServer() async {
    if (kIsWeb) {
      //web
    } else {

      API api = API();
      final response = await api.getStaticPage();
      AppData cacheYoneticim = AppData();

      //splash cache
      String splashLogo = response["splash"]["logo"];
      String splashBg = response["splash"]["background"];

      if(splashLogo.isNotEmpty && splashLogo.startsWith("http"))
      {
        final Directory appCacheDir = await getApplicationCacheDirectory();

        await api.download(splashLogo, 
          "${appCacheDir.path}/splashLogo.${splashLogo.split('.').last.split('?').first}"
        );

        response["splash"]["logo"] = 
          "${appCacheDir.path}/splashLogo.${splashLogo.split('.').last.split('?').first}";
      }

      if(splashBg.isNotEmpty && splashBg.startsWith("http"))
      {
        final Directory appCacheDir = await getApplicationCacheDirectory();

        await api.download(splashBg, 
          "${appCacheDir.path}/splashBg.${splashBg.split('.').last.split('?').first}"
        );

        response["splash"]["logo"] = 
          "${appCacheDir.path}/splashBg.${splashBg.split('.').last.split('?').first}";
      }      


      cacheYoneticim.saveMapToCache("splash.json", response["splash"]);
      cacheYoneticim.saveMapToCache("profile.json", response["profile"]);
      
      
    }
  }
  //pages to display

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const ChatPage(),
  ];
  @override
  void initState() {
    //internet bağlantıs var yok durumu için kullandık
    syncServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context) => Padding(
                  padding: const EdgeInsets.only(left: 22, top: 12),
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).colorScheme.secondary, //THEME
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                )),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //Profile
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProfileItem(
                      user: "Gökhan",
                      avatar: "assets/images/logo.png",
                      onTap: () {
                        GoRouter.of(context).push("/profile");
                      }),
                ),
                const Gap(20),
                // other pages
                InkWell(
                  onTap: () => GoRouter.of(context).push("/home"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(
                        Icons.home,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_home")),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/address"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: const Icon(Icons.location_city),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_address")),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/credit"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: const Icon(Icons.credit_card),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_credit")),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/todo"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: const Icon(Icons.list),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_todo")),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/settings"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: const Icon(Icons.settings),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_settings")),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () => GoRouter.of(context).push("/about"),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: const Icon(Icons.info),
                      title: Text(AppLocalizations.of(context)
                          .getTranslate("drawer_about")),
                    ),
                  ),
                ),
              ],
            ),
            // LOGOUT
            InkWell(
              onTap: () => GoRouter.of(context).push("/logout"),
              child: const Padding(
                padding: EdgeInsets.only(left: 25, bottom: 25),
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Logout"),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
