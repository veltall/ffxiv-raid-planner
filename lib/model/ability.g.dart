// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.ability;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$AbilityJsonSerializer implements Serializer<Ability> {
  @override
  Map<String, dynamic> toMap(Ability model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'classjob_category', model.classjobCategory);
      setNullableValue(ret, 'icon', model.icon);
      setNullableValue(ret, 'id', model.id);
      setNullableValue(ret, 'level', model.level);
      setNullableValue(ret, 'recast_time', model.recastTime);
      setNullableValue(ret, 'help', model.help);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  Ability fromMap(Map<String, dynamic> map, {Ability model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new Ability();
    obj.name = map['name'] as String;
    obj.classjobCategory = map['classjob_category'] as String;
    obj.icon = map['icon'] as String;
    obj.id = map['id'] as int;
    obj.level = map['level'] as int;
    obj.recastTime = map['recast_time'] as double;
    obj.help = map['help'] as String;
    return obj;
  }

  @override
  String modelString() => 'Ability';
}
