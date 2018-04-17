// GENERATED CODE - DO NOT MODIFY BY HAND

part of raidplanner.ability;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$JsonAbilitySerializer implements Serializer<JsonAbility> {
  @override
  Map<String, dynamic> toMap(JsonAbility model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'name', model.name);
      setNullableValue(ret, 'recast_time', model.recastTime);
      setNullableValue(ret, 'classjob_category', model.classjobCategory);
      setNullableValue(ret, 'help', model.help);
      setNullableValue(ret, 'icon', model.icon);
      setNullableValue(ret, 'id', model.id);
      setNullableValue(ret, 'level', model.level);
      setNullableValue(ret, 'action_category', model.actionCategory);
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  JsonAbility fromMap(Map<String, dynamic> map, {JsonAbility model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new JsonAbility();
    obj.name = map['name'] as String;
    obj.recastTime = map['recast_time'] as num;
    obj.classjobCategory = map['classjob_category'] as String;
    obj.help = map['help'] as String;
    obj.icon = map['icon'] as String;
    obj.id = map['id'] as int;
    obj.level = map['level'] as int;
    obj.actionCategory = map['action_category'] as int;
    return obj;
  }

  @override
  String modelString() => 'JsonAbility';
}
