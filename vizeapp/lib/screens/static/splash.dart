import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  loadData() async {
    //memory read

    Future.delayed(const Duration(seconds: 3),(){
      context.go("/boarding");
    });
  }

  @override
  void initState() {
    super.initState();

    loadData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration:const BoxDecoration(color: Colors.blue,        
          ),
          child:  Stack(children: [
            Center(child: Image.asset("assets/images/logo.png")),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 95),
                child: CircularProgressIndicator(),
              )),
          ],),
        ),
      ),
    );
  }
}