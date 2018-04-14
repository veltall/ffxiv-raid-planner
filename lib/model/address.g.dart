// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.address;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$AddressJsonSerializer implements Serializer<Address> {
  @override
  Map<String, dynamic> toMap(Address model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'street', model.street);
      setNullableValue(ret, 'zipcode', model.zipcode);
      setNullableValue(ret, 'country', model.country);
      setNullableValue(ret, 'city', model.city);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Address fromMap(Map<String, dynamic> map, {Address model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Address();
    obj.street = map['street'] as String;
    obj.zipcode = map['zipcode'] as String;
    obj.country = map['country'] as String;
    obj.city = map['city'] as String;
    return obj;
  }

  @override
  String modelString() => 'Address';
}
