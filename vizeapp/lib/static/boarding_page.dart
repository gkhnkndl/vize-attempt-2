import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:vizeapp/components/boarding_item.dart';
import 'package:vizeapp/screens/home_page.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(children: const [
          Center(
              child: BoardingItem(
                  image:
                      "https://sneakernews.com/wp-content/uploads/2009/12/sneakernews-top-30-sneakers-2009-summary.jpg",
                  title: "Kendine en çok yakışanı al",
                  description: "Aradığın ayakkabı hemen yarın kapında, sende SneakerPlace'i tercih et sende kazan.")),
        ]),
      ),
    );
  }
}
