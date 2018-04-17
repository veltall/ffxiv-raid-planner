library raidplanner.encounter;
import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'json_encounter.g.dart';

@GenSerializer()
class JsonEncounterSerializer extends Serializer<JsonEncounter> with _$JsonEncounterSerializer {
  JsonEncounter createModel() => new JsonEncounter();
}
class JsonEncounter {
  String title;
  String author;
  int enrage; // in seconds
  List<Map<String,String>> timelineData;
}