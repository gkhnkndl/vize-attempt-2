import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {

  loadApp() async{
    final storage = Storage();
    final firstLaunch = await storage.isFirtsLaunch();

    if(firstLaunch){
      //boarding
      GoRouter.of(context).replace("/boarding");
    }
    else{
      //ana ekran
      GoRouter.of(context).replace("/home");
    }
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(child: CircularProgressIndicator(
        color: Colors.black,

      ),)
    );
  }
}