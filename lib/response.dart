import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'ffxiv_ability.dart';

class Response {
  final List<Ability> actions = <Ability>[];
  final int time;

  Response({@required this.time}) {
    assert(this.time != null);
    assert(this.time >= 0);
  }

  Response addAbility({@required Ability ability}) {
    if (ability.isValidActivationTime(time: time)) {
      if (actions.contains(ability)) {
        throw new ArgumentError('Ability already added to this event.');
      }
      actions.add(ability);
      return this;
    } else throw new ArgumentError('Invalid time data during Ability addition process.');
  }

  Response removeAbility({@required Ability ability}) {
    if (ability.isInHistory(time: time)) {
      actions.remove(ability);
    }
    return this;  // yields a response without the ability in question either way
  }
}

class ResponseWidget extends StatefulWidget {
  final Response response;

  ResponseWidget({@required this.response});
  
  @override
  _ResponseWidgetState createState() => new _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  @override
  Widget build(BuildContext context) {
    var list = widget.response.actions;
    int _max = list.length > 5 ? 5 : list.length;
    List<Ability> firstFive = widget.response.actions.sublist(0,_max);
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,   // TODO: ultimately this line should not matter, use Column's crossaxis
        children: firstFive.map((ability){
          return new CircleAvatar(
            radius: 10.0,
            backgroundImage: new AssetImage(ability.iconPath),
          );
        }).toList(),
      ),
    );
  }
}

class ResponseScreen extends StatefulWidget {
  @override
  _ResponseScreenState createState() => new _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      
    );
  }
}