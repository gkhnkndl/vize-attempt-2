import 'package:go_router/go_router.dart';

import '../screens/static/about_page.dart';
import '../screens/adress_page.dart';
import '../screens/payment_page.dart';
import '../screens/home_page.dart';
import '../screens/static/boarding_page.dart';
import '../screens/settings_page.dart';
import '../screens/todopage.dart';
import '../core/error.dart';
import '../core/loader.dart';



// GoRouter configuration
final routes = GoRouter(
  errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoaderScreen(),
    ),
    GoRoute(
      path: '/boarding',
      builder: (context, state) => const BoardingPage(),
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
      builder: (context, state) => const PaymentPage(),
    ),  
    GoRoute(
      path: "/address",
      builder: (context, state) => const AddressPage(),
    ),  
    GoRoute(
      path: "/logout",
      builder: (context, state) => const BoardingPage(),
    ),  
    GoRoute(
      path: "/about",
      builder: (context, state) => const AboutPage(),
    ),    
  ],
);
