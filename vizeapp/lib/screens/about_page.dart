import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: AppBar(
        title: Text("About"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ), 
      body: Center(
        child: Text("ABOUT"),
      ),
    );
  }
}