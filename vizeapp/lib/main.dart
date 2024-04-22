import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/bloc/client/client_cubit.dart';
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
    /*daha önce ChangeNotifierProvider kullandım
    bu yüzden BlocProvider kullanmak için MultiProvider kullandım
    https://stackoverflow.com/questions/61052629/how-to-add-multiple-changenotifierprovider-in-same-type-in-flutter
    */ 
    return MultiProvider(providers: [
      //Add cart ve cart item için provider     
      ChangeNotifierProvider(create: (context) => Cart(), //54:59
    builder: (context, child) => MaterialApp.router(
      routerConfig: routes,
       title: "SneakerPlace",      
      debugShowCheckedModeBanner: false,      
      theme: Provider.of<ThemeProvider>(context).themeData,
    )),
    //Language için provider
    BlocProvider(create: (context) => ClientCubit(ClientState(language: "en")),/*child: 
    BlocBuilder<ClientCubit, ClientState>(builder: (context, state) {
      return MaterialApp.router(
      routerConfig: routes,
       title: "SneakerPlace",      
      debugShowCheckedModeBanner: false,      
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
    },)*/)
    ]);
  }
}