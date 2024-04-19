import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("about"),
    );
  }
}