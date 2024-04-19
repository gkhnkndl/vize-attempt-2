import 'package:flutter/material.dart';

class CreditPage extends StatefulWidget {
  const CreditPage({super.key});

  @override
  State<CreditPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<CreditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: AppBar(
        title: Text("Credit Carts"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ), 
      body: Center(
        child: Text("CREDIT CARTS"),
      ),
    );
  }
}