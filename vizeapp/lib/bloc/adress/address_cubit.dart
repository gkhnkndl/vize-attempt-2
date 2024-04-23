import 'package:flutter_bloc/flutter_bloc.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
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
      "country": ulke,
      "city": sehir,
      "district":ilce,
      "neighborhood": mahalle,
      "street": sokak,
      "apartment": bina,
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
