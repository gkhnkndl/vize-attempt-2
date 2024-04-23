import 'package:flutter/material.dart';

import '../models/shoe.dart';

class ShoeTile extends StatelessWidget {
  Shoe shoe;
  void Function()? onTap;
  ShoeTile({super.key, required this.shoe,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(left: 20),
      width: 280,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary, borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //shoe picture
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(shoe.imagePath)),
          //description
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(shoe.descripton, style: TextStyle(color: Theme.of(context).colorScheme.onPrimaryContainer),),
          ),
          //price + detail
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //shoe name
                    Text(
                      shoe.name,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer,
                          fontWeight: FontWeight.bold, fontSize: 16,),
                    ),
                    // price
                    const SizedBox(height: 5),

                    Text(
                      '\$${shoe.price}',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 29, 173, 10)),
                    ),
                  ],
                ),
                // plus button
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration:  BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimaryContainer,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
