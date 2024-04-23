import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../core/localization.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          tabActiveBorder:
              Border.all(color: Theme.of(context).colorScheme.primary),
          tabBackgroundColor: Theme.of(context).colorScheme.background,
          mainAxisAlignment: MainAxisAlignment.center,
          tabBorderRadius: 30,
          onTabChange: (value) => onTabChange!(value),
          activeColor: Colors.blueAccent[200],
          tabs: [
            GButton(
              icon: Icons.home,
              text: AppLocalizations.of(context).getTranslate("shopping_navShop"),
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: AppLocalizations.of(context).getTranslate("shopping_navCart"),
            ),
            GButton(
              icon: Icons.chat_bubble,
              text: AppLocalizations.of(context).getTranslate("shopping_navAsk"),
            )
          ]),
    );
  }
}
