// GENERATED CODE - DO NOT MODIFY BY HAND

part of raidplanner.encounter;

// **************************************************************************
// Generator: JaguarSerializerGenerator
// **************************************************************************

abstract class _$JsonEncounterSerializer implements Serializer<JsonEncounter> {
  @override
  Map<String, dynamic> toMap(JsonEncounter model,
      {bool withType: false, String typeKey}) {
    Map<String, dynamic> ret;
    if (model != null) {
      ret = <String, dynamic>{};
      setNullableValue(ret, 'title', model.title);
      setNullableValue(ret, 'author', model.author);
      setNullableValue(ret, 'enrage', model.enrage);
      setNullableValue(
          ret,
          'timelineData',
          nullableIterableMapper(
              model.timelineData,
              (val) => nullableMapMaker(
                  val as Map<String, dynamic>, (val) => val as String)));
      setTypeKeyValue(typeKey, modelString(), withType, ret);
    }
    return ret;
  }

  @override
  JsonEncounter fromMap(Map<String, dynamic> map, {JsonEncounter model}) {
    if (map == null) {
      return null;
    }
    final obj = model ?? new JsonEncounter();
    obj.title = map['title'] as String;
    obj.author = map['author'] as String;
    obj.enrage = map['enrage'] as int;
    obj.timelineData = nullableIterableMapper<Map<String, String>>(
        map['timelineData'] as Iterable,
        (val) => nullableMapMaker<String>(
            val as Map<String, dynamic>, (val) => val as String));
    return obj;
  }

  @override
  String modelString() => 'JsonEncounter';
}
