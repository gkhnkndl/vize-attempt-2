import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../bloc/adress/address_cubit.dart';

class AddressAddView extends StatefulWidget {
  const AddressAddView({super.key});
  
  @override
  State<AddressAddView> createState() => _AddressAddViewState();
}

class _AddressAddViewState extends State<AddressAddView> {
  late AddressCubit addressCubit;
  late TextEditingController ulkeCont;
  late TextEditingController sehirCont;
  late TextEditingController ilceCont;
  late TextEditingController mahalleCont;
  late TextEditingController sokakCont;
  late TextEditingController binaCont;
  late TextEditingController daireCont;
  late TextEditingController postaKoduCont;


@override
  void dispose() {
    ulkeCont.dispose();
    sehirCont.dispose();
    ilceCont.dispose();
    mahalleCont.dispose();
    sokakCont.dispose();
    binaCont.dispose();
    daireCont.dispose();
    postaKoduCont.dispose();

    super.dispose();
  }


  MaterialStateProperty<Color?> overlayColor =
      MaterialStateColor.resolveWith((states) => Colors.cyan);
  @override
  void initState() {
    addressCubit = context.read<AddressCubit>();
    ulkeCont = TextEditingController();
    sehirCont = TextEditingController();
    ilceCont = TextEditingController();
    mahalleCont = TextEditingController();
    sokakCont = TextEditingController();
    binaCont = TextEditingController();
    daireCont = TextEditingController();
    postaKoduCont = TextEditingController();    
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => AddressCubit(AddressState(address: [])),
    child: BuildScaffold(addressCubit: addressCubit, overlayColor: overlayColor,),);
  }
}

class BuildScaffold extends StatelessWidget {
  
  const BuildScaffold({
    super.key,
    required this.addressCubit,
    required this.overlayColor,
  });

  final AddressCubit addressCubit;
  final MaterialStateProperty<Color?> overlayColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(25),
        children: [
          const Gap(20),
          const TextFieldItem(labelText: "Country",),
          const Gap(20),
          const TextFieldItem(labelText: "City"),
          const Gap(20),
          const TextFieldItem(labelText: "Neighborhood"),
          const Gap(20),
          const TextFieldItem(labelText: "Street"),
          const Gap(20),
          const TextFieldItem(labelText: "Building"),
          const Gap(20),
          const TextFieldItem(labelText: "House Number"),
          const Gap(20),
          const TextFieldItem(labelText: "Postal Code"),
          const Gap(50),
          const Divider(),
          ElevatedButton(
              style: ButtonStyle(backgroundColor: overlayColor),
              onPressed: () {},
              child: Text(                
                'Save',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                ),
              )),
          const Divider(),
          Center(
            child: BlocBuilder<AddressCubit, AddressState>(
              builder: (context, state) {
                return Scaffold(
                  body: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Center(
                      child: Column(
                        children: [
                          Text("Addresses: ${state.address}"),
                          const Column(
                            children: [],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldItem extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;

  const TextFieldItem({
    super.key,
    required this.labelText, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.name,
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
          hoverColor: Colors.cyan.shade300,
          focusColor: Theme.of(context).colorScheme.background,
          labelStyle: const TextStyle(color: Colors.cyan),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.cyan,
          )),
          labelText: labelText,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan.shade300))),
    );
  }
}
