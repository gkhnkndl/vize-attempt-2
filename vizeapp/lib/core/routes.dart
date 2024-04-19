import 'package:go_router/go_router.dart';

import '../pages/about_page.dart';
import '../pages/adress_page.dart';
import '../pages/credit_page.dart';
import '../pages/intro_page.dart';
import '../pages/settings_page.dart';
import '../pages/todopage.dart';



// GoRouter configuration
final routes = GoRouter(
  //errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      path: "/settings",
      builder: (context, state) => const SettingsPage(),
    ),  
    GoRoute(
      path: "/todo",
      builder: (context, state) => const ToDoPage(),
    ),  
    GoRoute(
      path: "/credit",
      builder: (context, state) => const CreditPage(),
    ),  
    GoRoute(
      path: "/address",
      builder: (context, state) => const AddressPage(),
    ),  
    GoRoute(
      path: "/logout",
      builder: (context, state) => const IntroPage(),
    ),  
    GoRoute(
      path: "/about",
      builder: (context, state) => const AboutPage(),
    ),    
  ],
);
