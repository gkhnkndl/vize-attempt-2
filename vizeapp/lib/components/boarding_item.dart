import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/localization.dart';

class BoardingItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;



  const BoardingItem({
    super.key, required this.image, required this.title, required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
                  children: [
      //logo
                  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          image, //IMAGEE
          height: 240,
        )),
                  const SizedBox(height: 40),
                  //title
                  Text(
      title, //TITLE
      style:const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
                  ),
                  const SizedBox(height: 40),
                  // sub title
                  Text(
      description, //DESCRIPTIONN
      textAlign: TextAlign.center,
      style:const TextStyle(
        fontSize: 16,
      ),
                  ),
                  const SizedBox(height: 80),
                  // shop now button
                  InkWell(
      onTap: () => GoRouter.of(context).push("/home"),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:const Color.fromARGB(255, 31, 31, 31),
        ),
        padding:const EdgeInsets.all(25),
        child: Center(
            child: Text(
          AppLocalizations.of(context)
                                  .getTranslate("boarding_button"),
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )),
      ),
                  ),
                  ],
                ),
    );
  }
}