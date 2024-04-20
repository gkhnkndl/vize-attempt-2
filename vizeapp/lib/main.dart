import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/models/cart.dart';

import '../core/routes.dart';
import 'theme/theme_provider.dart';

void main() async {

  //init the hive
  await Hive.initFlutter();

  //open a box
  var box = await Hive.openBox('mybox');

  runApp( ChangeNotifierProvider(create: (context) => ThemeProvider(),
  child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 

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