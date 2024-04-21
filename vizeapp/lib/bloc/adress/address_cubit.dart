import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {

  final TextEditingController ulkeCont = TextEditingController();
  final TextEditingController sehirCont = TextEditingController();
  final TextEditingController ilceCont = TextEditingController();
  final TextEditingController mahalleCont = TextEditingController();
  final TextEditingController sokakCont = TextEditingController();
  final TextEditingController binaCont = TextEditingController();
  final TextEditingController daireCont = TextEditingController();
  final TextEditingController postaKoduCont = TextEditingController();


  AddressCubit(super.initialState);

  

  addAddress({
    required String ulke,
    required String sehir,
    required String ilce,
    required String mahalle,
    required String sokak,
    required String bina,
    required String daire,
    required String postaKodu,
  }) {
    var presentAddress = state.address;

    presentAddress.add({
      "contry": ulke,
      "city": sehir,
      "town": ilce,
      "neighborhood": mahalle,
      "street": sokak,
      "build": bina,
      "house": daire,
      "postalCode": postaKodu
    });

    final newState = AddressState(
      address: presentAddress,
    );
    emit(newState);
  }

  removeAddress({
    required String ulke,
    required String sehir,
    required String ilce,
    required String mahalle,
    required String sokak,
    required String bina,
    required String daire,
    required String postaKodu,
  }) {
    final newState = AddressState(
      address: [],
    );
    emit(newState);
  }
}
