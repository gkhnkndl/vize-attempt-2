import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:vizeapp/core/storage.dart';

import '../models/credit_card.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<PaymentPage> {
  List<PaymentCard> cards = [];

  bool remember = false;
  loadCards() async {
    final storage = Storage();
    var cards = await storage.loadCards();
    setState(() {
      this.cards = cards;
    });
  }

  saveCard() async {}

  @override
  void initState() {
    super.initState();
    loadCards();
  }

  showAddCard() {
    showDialog(
        context: context,
        builder: (context) {
          MaterialStateProperty<Color?> overlayColor =
              MaterialStateColor.resolveWith((states) => Colors.transparent);

          TextEditingController cardNoCnt = TextEditingController();
          TextEditingController cardHolderCnt = TextEditingController();
          TextEditingController cvv2Cnt = TextEditingController();
          TextEditingController expYearCnt = TextEditingController();
          TextEditingController expMonthCnt = TextEditingController();
          TextEditingController titleCnt = TextEditingController();

          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              title: const Text("Add new card"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    decoration: InputDecoration(
                        hoverColor: Colors.cyan.shade300,
                        focusColor: Theme.of(context).colorScheme.background,
                        hintText: "Card Title",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan.shade300))),
                    controller: titleCnt,
                  ),
                  const Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    decoration: InputDecoration(
                        hoverColor: Colors.cyan.shade300,
                        focusColor: Theme.of(context).colorScheme.background,
                        hintText: "Card Holder",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan.shade300))),
                    controller: cardHolderCnt,
                  ),
                  const Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 16,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    decoration: InputDecoration(
                        hoverColor: Colors.cyan.shade300,
                        focusColor: Theme.of(context).colorScheme.background,
                        hintText: "Card No",
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan.shade300))),
                    controller: cardNoCnt,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 3,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          obscureText: true,
                          decoration: InputDecoration(
                              hoverColor: Colors.cyan.shade300,
                              focusColor:
                                  Theme.of(context).colorScheme.background,
                              
                              hintText: "CVV2",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.cyan.shade300))),
                          controller: cvv2Cnt,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          maxLength: 2,
                          decoration: InputDecoration(
                              hoverColor: Colors.cyan.shade300,
                              focusColor:
                                  Theme.of(context).colorScheme.background,
                              hintText: "Ending Month",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.cyan.shade300))),
                          controller: expMonthCnt,
                        ),
                      ),
                      const Gap(10),
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          maxLength: 2,
                          decoration: InputDecoration(
                              hoverColor: Colors.cyan.shade300,
                              focusColor:
                                  Theme.of(context).colorScheme.background,
                              hintText: "Ending Year",
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.cyan.shade300))),
                          controller: expYearCnt,
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  SwitchListTile(
                    activeTrackColor: Theme.of(context).colorScheme.secondary,
                    activeColor: Color.fromARGB(255, 39, 255, 32),
                    trackColor: overlayColor,
                    value: remember,
                    title:
                        const Text("Keep Card", style: TextStyle(fontSize: 20)),
                    onChanged: (value) => setState(
                      () {
                        remember = value;
                      },
                    ),
                  ),
                ],
              ),
              actions: [
                OutlinedButton(
                  onPressed: saveCard,
                  child: Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.secondary),
                  ),
                ),
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton.outlined(
                onPressed: showAddCard, icon: const Icon(Icons.add)),
          )
        ],
        title: const Text("Credit Carts"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: SizedBox.expand(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                if (cards.isEmpty) const Text("No Card Found"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
