/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizeapp/bloc/adress/address_cubit.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<AddressPage> {
  late AddressCubit addressCubit;

  @override
  void initState() {
    addressCubit = context.read<AddressCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddressCubit(AddressState(address: [])),
      child: Center(
        child: Text("Addreslerim" + addressCubit.state.address.toString()),
      ),
      );      
  }
}
*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vizeapp/bloc/adress/address_cubit.dart';

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
        title: Text('Addresses'),
      ),
      body: Center(
        child: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            return Text("Addresses: ${state.address}");
          },
        ),
      ),
    );
  }
}