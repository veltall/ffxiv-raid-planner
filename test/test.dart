import 'package:jaguar_serializer/jaguar_serializer.dart';
import 'package:ffxiv_raid_planner/model/user.dart';


void main() {
  final userSerializer = new UserJsonSerializer();

  User user = userSerializer.fromMap({
    'name': 'John',
    'age': 25
  });

  print(userSerializer.toMap(user));

  final jsonRepository = new JsonRepo()..add(new UserJsonSerializer());
  User user2 = jsonRepository.deserialize('{"name":"John","age": 25}', type: User);
  // User luser = jsonRepository.deserialize("{'name':'John','age': 25}", type: User);
  print(jsonRepository.serialize(user2));
}