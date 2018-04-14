library example.ability;
import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'ability.g.dart';

@GenSerializer(
  fields: const {
    'classjobCategory': const EnDecode(alias: 'classjob_category'),
    'recastTime': const EnDecode(alias: 'recast_time'),
  }
)
class AbilityJsonSerializer extends Serializer<Ability> with _$AbilityJsonSerializer {
  Ability createModel() => new Ability();
}
class Ability {
  String name;
  String classjobCategory;
  String icon;
  int id;
  int level;
  double recastTime;
  String help;
}