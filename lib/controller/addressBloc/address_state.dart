part of 'address_bloc.dart';

@immutable
class AddressState {
  Placemark currentAddress;
  AddressState({required this.currentAddress});
}

class AddressInitial extends AddressState {
  AddressInitial()
      : super(
            currentAddress: Placemark(
                locality: "Address 1", subAdministrativeArea: "Address Line"));
}
