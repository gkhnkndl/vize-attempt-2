import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizeapp/bloc/adress/address_cubit.dart';

import '../components/address_add.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddressCubit(AddressState(address: [])),
      child: AddressPageContent(),
    );
  }
}

class AddressPageContent extends StatefulWidget {
  @override
  State<AddressPageContent> createState() => _AddressPageContentState();
}

class _AddressPageContentState extends State<AddressPageContent> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        centerTitle: true,
        title: Text('Addresses'),
      ),
      body: AddressAddView()
    );
  }
}
