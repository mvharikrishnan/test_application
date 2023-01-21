part of 'address_bloc.dart';

@immutable
abstract class AddressEvent {}

class changeAddress extends AddressEvent {
  changeAddress();
}
