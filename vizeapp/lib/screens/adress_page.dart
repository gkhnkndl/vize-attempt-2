import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: AppBar(
        title:const Text("Address"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ), 
      body:const Center(
        child: Text("ADDRESS"),
      ),
    );
  }
}
