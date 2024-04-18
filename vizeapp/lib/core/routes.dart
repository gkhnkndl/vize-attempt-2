import 'package:go_router/go_router.dart';
import 'package:vizeapp/pages/gemini_chat.dart';
import 'package:vizeapp/pages/home_page.dart';
import 'package:vizeapp/pages/intro_page.dart';


// GoRouter configuration
final routes = GoRouter(
  //errorBuilder: (context, state) => const ErrorScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const IntroPage(),
    ),
    GoRoute(
      path: "/cart",
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: "/chat",
      builder: (context, state) => const ChatPage(),
    ),
  ],
);
//onTap: () => context.push("/brands"),