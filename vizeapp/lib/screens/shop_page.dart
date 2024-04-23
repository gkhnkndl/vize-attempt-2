import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:vizeapp/core/localization.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user when successfully add
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        title: Text("Successfully added."),
        content: Text("Check your cart."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Consumer<Cart>(
        builder: (context, value, child) => Column(
          children: [
            // search bar
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(AppLocalizations.of(context)
                      .getTranslate("shopping_search"), style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),),
                  Icon(Icons.search, color:Theme.of(context).colorScheme.onSecondaryContainer ,),
                ],
              ),
            ),
            // message
            Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Text(
                  AppLocalizations.of(context).getTranslate("boarding_title")),
            ),
            // hot pics
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    AppLocalizations.of(context)
                        .getTranslate("shopping_seeall"),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  Text(
                    AppLocalizations.of(context)
                        .getTranslate("shopping_products"),
                    style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.onPrimaryContainer),
                  )
                ],
              ),
            ),
            const Gap(20),
            SizedBox(
                height: 450,
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //create a shoe
                    Shoe shoe = value.getShoeList()[index];
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                )),
            Padding(
              padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
              child: Divider(color: Theme.of(context).colorScheme.onSecondaryContainer),
            )
          ],
        ),
      ),
    );
  }
}
