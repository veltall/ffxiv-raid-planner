library raidplanner.ability;
import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'json_ability.g.dart';

@GenSerializer(
  fields: const {
    'classjobCategory': const EnDecode(alias: 'classjob_category'),
    'recastTime': const EnDecode(alias: 'recast_time'),
    'actionCategory': const EnDecode(alias: 'action_category'),
  }
)
class JsonAbilitySerializer extends Serializer<JsonAbility> with _$JsonAbilitySerializer {
  JsonAbility createModel() => new JsonAbility();
}
class JsonAbility {
  String name;
  num recastTime;
  String classjobCategory;
  String help;
  String icon;
  int id;
  int level;
  int actionCategory;
}