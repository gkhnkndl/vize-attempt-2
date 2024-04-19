import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/models/cart.dart';
import 'package:vizeapp/pages/gemini_chat.dart';
import 'package:vizeapp/pages/home_page.dart';
import 'package:vizeapp/pages/intro_page.dart';
import 'package:vizeapp/pages/settings_page.dart';
import 'package:vizeapp/pages/todopage.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:vizeapp/theme/theme.dart';
import 'package:vizeapp/theme/theme_provider.dart';
import 'package:vizeapp/components/todo_tile.dart';

import '../core/routes.dart';

void main() async {

  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');

  runApp( ChangeNotifierProvider(create: (context) => ThemeProvider(),
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
 

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Cart(),
    builder: (context, child) => MaterialApp.router(
      routerConfig: routes,
       title: "SneakerPlace",      
      debugShowCheckedModeBanner: false,      
      theme: Provider.of<ThemeProvider>(context).themeData,
    ));
  }
}