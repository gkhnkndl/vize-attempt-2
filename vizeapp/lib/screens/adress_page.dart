import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizeapp/bloc/adress/address_cubit.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  
  late AddressCubit addressCubit;

  @override
  void initState() {
    addressCubit = context.read<AddressCubit>();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          const Center(
            child: Text("ADDRESS"),
          ),
          Center(
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                return Text("Addresses: " + addressCubit.state.address.toString());
              },
            ),
          ),
        ],
      ),
    );
  }
}
