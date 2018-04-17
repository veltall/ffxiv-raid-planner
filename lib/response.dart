import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'ffxiv_ability.dart';

class Response {
  final Duration recasttime = new Duration(seconds: 90);
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
  int _displayMax;

  @override
  void initState() {
    // retrieve data
    var list = widget.response.actions;
    _displayMax = list.length > 5 ? 5 : list.length;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Ability> firstFive = widget.response.actions.sublist(0,_displayMax);
    // build UI
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,   // TODO: ultimately this line should not matter, use Column's crossaxis
        children: firstFive.map((ability){
          return (ability != null) 
            ? new CircleAvatar(
                radius: 10.0,
                backgroundImage: new AssetImage(ability.iconPath),
              )
            : new CircleAvatar(
                radius: 10.0,
                child: new Text('...'),
              );
        }).toList(),
      ),
    );
  }
}

class ResponseScreen extends StatefulWidget {
  final Response response;
  ResponseScreen({@required this.response}) {
    assert(this.response != null);
  }

  @override
  _ResponseScreenState createState() => new _ResponseScreenState();
}

class _ResponseScreenState extends State<ResponseScreen> {
  Random rng = new Random();
  List<Ability> allSkills = <Ability>[];

  @override
  void initState() {
    allSkills.add(new Ability(name: "Convalescence", recast: 120));
    allSkills.add(new Ability(name: "Holmgang", recast: 180));
    allSkills.add(new Ability(name: "Rampart", recast: 90));
    allSkills.add(new Ability(name: "Raw Intuition", recast: 90));
    allSkills.add(new Ability(name: "Vengeance", recast: 120));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Respond to Event'),
        actions: <Widget>[
          new Icon(Icons.save),
        ],
      ),
      body: new ListView(
        addAutomaticKeepAlives: true,
        children: widget.response.actions.map((ability){
          return Row(
            children: <Widget>[
              new DetailedAbilityWidget(ability: ability),
              new Icon(Icons.remove),
            ],
          );
        }).toList(),
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.add),
        onPressed: _handleFABPress(context),
      ),
    );
  }

  _handleFABPress(BuildContext context) {
    // dummy behavior: add a random skill to the event for each press
    if (allSkills.length > 0) {
      int next = rng.nextInt(5);
      setState(() => widget.response.actions.add(allSkills[next]));
      allSkills.remove(next);
    } else Scaffold.of(context).showSnackBar(new SnackBar(content: new Text('Added all available skills')));
  }
}