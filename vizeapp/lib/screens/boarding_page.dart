import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../components/boarding_item.dart';

class BoardingPage extends StatefulWidget {
  const BoardingPage({super.key});

  @override
  State<BoardingPage> createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  final boardingData = [
    {
      "image": "assets/images/jordan.png",
      "title": "Kendine en çok yakışanı al",
      "description":
          "Aradığın ayakkabı hemen yarın kapında, sende SneakerPlace'i tercih et sende kazan.",
    },
    {
      "image": "assets/images/newbalance.png",
      "title": "Dengeyi hisset",
      "description":
          "Aradığın ayakkabı hemen yarın kapında, sende SneakerPlace'i tercih et sende kazan.",
    },
    {
      "image": "assets/images/walker3.png",
      "title": "Koşmanın doğru adımı",
      "description":
          "Aradığın ayakkabı hemen yarın kapında, sende SneakerPlace'i tercih et sende kazan."
    },
    {
      "image": "assets/images/walker2.png",
      "title": "Maratonlar artık çok kısa",
      "description":
          "Aradığın ayakkabı hemen yarın kapında, sende SneakerPlace'i tercih et sende kazan."
    }
  ];

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: PreloadPageView.builder(
              itemCount: boardingData.length,
              preloadPagesCount: boardingData.length,
              onPageChanged: (value) {
                setState(() {
                  page = value;
                });
              },
              itemBuilder: (context, index) => BoardingItem(
                  image: boardingData[index]["image"]!,
                  title: boardingData[index]["title"]!,
                  description: boardingData[index]["description"]!)),
        ),
        bottomNavigationBar: SizedBox(
            
            height: 70,
            child: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,            
                itemCount: boardingData.length,
                itemBuilder: (context, index) => Icon(page == index
                    ? CupertinoIcons.circle_filled
                    : CupertinoIcons.circle),
              ),
            )),
      ),
    );
  }
}
