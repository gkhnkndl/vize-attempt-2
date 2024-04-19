import 'package:go_router/go_router.dart';

import '../screens/about_page.dart';
import '../screens/adress_page.dart';
import '../screens/credit_page.dart';
import '../screens/home_page.dart';
import '../screens/intro_page.dart';
import '../screens/settings_page.dart';
import '../screens/todopage.dart';
import '../core/error.dart';



// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => const HomePage(),
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
