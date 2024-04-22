import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        body: BlocBuilder<AddressCubit, AddressState>(
          builder: (context, state) {
            

            return Center(
              child: Column(
                children: [
                  Text("Addresses: " + addressCubit.state.address.toString()),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AddressCubit>().addAddress(
                            ulke: "ulke",
                            sehir: "sehir",
                            mahalle: "mahalle",
                            sokak: "sokak",
                            bina: "bina",
                            daire: "daire",
                            postaKodu: "postaKodu");
                      },
                      child: Text("s"))
                ],
              ),
            );
          },
        ));
  }
}

           /*   Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text("ADDRESS"),
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  return Text(
                      "Addresses: " + addressCubit.state.address.toString());
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    addressCubit.addAddress(
                        ulke: "ulkeCnt",
                        sehir: "sehirCnt",
                        mahalle: "mahalleCnt",
                        sokak: "sokakCnt",
                        bina: "binaCnt",
                        daire: "daireCnt",
                        postaKodu: "postaKoduCnt");
                  },
                  child: Text("Add Address")),
              
            ],
          ),
        ),
      ),*/
