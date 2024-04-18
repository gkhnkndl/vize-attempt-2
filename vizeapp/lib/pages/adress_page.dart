import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("adress"),
    );
  }
}