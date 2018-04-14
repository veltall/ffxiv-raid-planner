library example.address;
import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'address.g.dart';

@GenSerializer()
class AddressJsonSerializer extends Serializer<Address> with _$AddressJsonSerializer {
  Address createModel() => new Address();
}
class Address {
  String street;
  String zipcode;
  String country;
  String city;
}