import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(        
        tabActiveBorder:Border.all(color: Theme.of(context).colorScheme.primary) ,
        tabBackgroundColor: Theme.of(context).colorScheme.background,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 30,
        onTabChange: (value) => onTabChange!(value),
        activeColor: Colors.blueAccent[200],tabs: const[   
           GButton(
          icon: Icons.home,
          text: 'Kirala',
        ),             
        GButton(
          icon: Icons.shopping_bag_rounded,
          text: 'Sepet',
        ),           
        GButton(icon: Icons.chat_bubble,
        text: 'Sor Bakalım AI',
        )
      ]),
    );
  }
}
