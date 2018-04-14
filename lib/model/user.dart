library example.user;

import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user.g.dart';

/// User model
class User {
  String name;
  int age;
}

@GenSerializer()
class UserJsonSerializer extends Serializer<User> with _$UserJsonSerializer {
  User createModel() => new User();
}