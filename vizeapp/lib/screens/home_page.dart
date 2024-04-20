import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeapp/components/bottom_nav_bar.dart';
import 'package:vizeapp/screens/adress_page.dart';
import 'package:vizeapp/screens/cart_page.dart';
import 'package:vizeapp/screens/payment_page.dart';
import 'package:vizeapp/screens/gemini_chat.dart';
import 'package:vizeapp/screens/shop_page.dart';
import 'package:vizeapp/screens/todopage.dart';

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

  //pages to display

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
    const ChatPage(),
  ];
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
                //logo
                DrawerHeader(child: Image.asset('assets/images/logo.png')),
                // other pages
                InkWell(
                  onTap: () => GoRouter.of(context).push("/home"),
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Home"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/address"),
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.location_city),
                      title: Text("My Address"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/credit"),
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.credit_card),
                      title: Text("Saved Credit Cards"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/todo"),
                  child: Container(
                    child: const Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: ListTile(
                        leading: Icon(Icons.list),
                        title: Text("To Do List"),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => GoRouter.of(context).push("/settings"),
                  child: Container(
                    child: const Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Settings"),
                      ),
                    ),
                  ),
                ),

                InkWell(
                  onTap: () => GoRouter.of(context).push("/about"),
                  child: const Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: ListTile(
                      leading: Icon(Icons.info),
                      title: Text("About"),
                    ),
                  ),
                ),
              ],
            ),
            // LOGOUT
            InkWell(
              onTap: () => GoRouter.of(context).push("/logout"),
              child: const Padding(
                padding: const EdgeInsets.only(left: 25, bottom: 25),
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
