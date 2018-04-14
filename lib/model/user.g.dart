// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.user;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserJsonSerializer implements Serializer<User> {
  final _addressJsonSerializer = new AddressJsonSerializer();

  @override
  Map<String, dynamic> toMap(User model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'age', model.age);
      setNullableValue(
          ret,
          'address',
          _addressJsonSerializer.toMap(model.address,
              withType: withType, typeKey: typeKey));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  User fromMap(Map<String, dynamic> map, {User model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new User();
    obj.name = map['name'] as String;
    obj.age = map['age'] as int;
    obj.address =
        _addressJsonSerializer.fromMap(map['address'] as Map<String, dynamic>);
    return obj;
  }

  @override
  String modelString() => 'User';
}
