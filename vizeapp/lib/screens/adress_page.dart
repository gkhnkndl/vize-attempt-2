import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:vizeapp/bloc/adress/address_cubit.dart';

import '../core/localization.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late AddressCubit addressCubit;

  MaterialStateProperty<Color?> overlayColor =
      MaterialStateColor.resolveWith((states) => Colors.grey);

  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController neighborhoodController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();

  @override
  void initState() {
    addressCubit = context.read<AddressCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).getTranslate("address_page")),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: BlocBuilder<AddressCubit, AddressState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(              
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Gap(10),
                  CustomTextFormField(controller: countryController,labelText: "Ülke"),
                  const Gap(10),
                  CustomTextFormField(controller: cityController,labelText: "Şehir"),
                  const Gap(10),
                  CustomTextFormField(controller: districtController,labelText: "İlçe/Eyalet"),
                  const Gap(10),
                  CustomTextFormField(controller: neighborhoodController,labelText: "Mahalle"),
                  const Gap(10),
                  CustomTextFormField(controller: streetController,labelText: "Sokak"),
                  const Gap(10),
                  CustomTextFormField(controller: buildingController,labelText: "Bina"),
                  const Gap(10),
                  CustomTextFormField(controller: apartmentController,labelText: "Daire"),
                  const Gap(10),
                  CustomTextFormField(controller: postalCodeController,labelText: "Posta Kodu"),                  
                  const Gap(25),
                  ElevatedButton(
                    style: ButtonStyle(backgroundColor: overlayColor),
                    onPressed: () {
                      context.read<AddressCubit>().addAddress(
                            ulke: countryController.text,
                            sehir: cityController.text,
                            ilce: districtController.text,
                            mahalle: neighborhoodController.text,
                            sokak: streetController.text,
                            bina: buildingController.text,
                            daire: apartmentController.text,
                            postaKodu: postalCodeController.text,
                          );
                    },
                    child: Text(AppLocalizations.of(context).getTranslate("save")),
                  ),
                  SizedBox(height: 20), // Araya boşluk ekledik
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.all(10),
                    child: BlocBuilder<AddressCubit, AddressState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [                            
                            SizedBox(height: 10),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: addressCubit.state.address.length,
                              itemBuilder: (context, index) {
                                final tempAddress = addressCubit.state.address[index];
                                return Column(
                                  children: [
                                    Text("Ülke :"+ tempAddress['country']),
                                    Text("Şehir :"+ tempAddress['city']),
                                    Text("İlçe/Eyalet :"+tempAddress['district']),
                                    Text("Mahalle :"+tempAddress['neighborhood']),
                                    Text("Sokak :"+tempAddress['street']),
                                    Text("Apartman :"+tempAddress['apartment']),
                                    Text("Daire :"+tempAddress['house']),
                                    Text("Posta Kodu :"+tempAddress['postalCode']),
                                    const Divider(),
                                  ],
                                );                         
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        labelText: labelText,
        hoverColor: Theme.of(context).colorScheme.secondary,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.secondary),
        focusColor: Theme.of(context).colorScheme.secondary,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.cyan),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
    );
  }
}
