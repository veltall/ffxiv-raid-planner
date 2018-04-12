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
      actions.add(ability);
      return this;
    } else throw new ArgumentError('Invalid time data during Ability addition process.');
  }

  Response removeAbility({@required Ability ability}) {
    if (ability.isInHistory(time: time)) {
      actions.remove(ability);
      return this;
    } else throw new ArgumentError('No such ability to remove from history.');
  }
}

class ResponseWidget extends StatefulWidget {
  @override
  _ResponseWidgetState createState() => new _ResponseWidgetState();
}

class _ResponseWidgetState extends State<ResponseWidget> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      
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