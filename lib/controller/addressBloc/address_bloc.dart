
import 'package:bloc/bloc.dart';
import 'package:geocoding/geocoding.dart';

import 'package:machine_test/services/getAddress.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  AddressBloc() : super(AddressInitial()) {
    on<changeAddress>((event, emit) async {
      var address = await getAddress.fetchAddress();
      emit(AddressState(currentAddress: address));
    });
  }
}
