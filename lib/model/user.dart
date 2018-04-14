library example.user;

import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'address.dart';
part 'user.g.dart';

/// User model
class User {
  String name;
  int age;
  Address address;
}

@GenSerializer(
  serializers: const [
    AddressJsonSerializer
  ]
)
class UserJsonSerializer extends Serializer<User> with _$UserJsonSerializer {
  User createModel() => new User();
}