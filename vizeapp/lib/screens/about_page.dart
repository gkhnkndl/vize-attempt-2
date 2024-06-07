import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(     
        appBar: AppBar(
          title:const Text("About"),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
        ), 
        body:const Center(
          child: Text("ABOUT"),
        ),
      ),
    );
  }
}