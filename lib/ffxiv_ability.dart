import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class Ability {
  // app-wide state
  static final Map<String, SplayTreeMap<int, bool>> _allhistory =
      new Map<String, SplayTreeMap<int, bool>>();

  // public identity data
  String name;
  Duration recast; // in milliseconds
  Duration duration;
  String job;
  String effect;

  // local data
  String iconPath;
  SplayTreeMap _history;

  Ability(
      {@required this.name,
      @required this.duration,
      @required this.recast,
      this.job,
      this.effect}) {
    // required named parameters
    assert(this.name != null);
    assert(this.duration != null);
    assert(this.recast != null);
    // icon's filename has no spaces, apostrophes, and is all lowercase
    RegExp spaceSelector = new RegExp(r"[\s|']+");
    final String filename = name.replaceAll(spaceSelector, "").toLowerCase();
    iconPath = 'res/images/icons/skills/$filename.png';
    if (_allhistory[name] == null)
      _allhistory[name] = new SplayTreeMap<int, bool>();
    _history = _allhistory[name];
  }

  bool isValidActivationTime({@required int time}) {
    // bool isDuplicate = _history.containsKey(time);
    return _overlapPrev(time) <= 0 && _overlapNext(time) <= 0;
  }

  bool isInHistory({@required int time}) {
    bool isDuplicate = _history.containsKey(time);
    return isDuplicate;
  }

  bool isInEffectAt({@required int time}) {
    int useTime = _history.lastKeyBefore(time);
    bool isInEffect = false;
    if (useTime != null && useTime + recast.inSeconds > time) {
      isInEffect = true;
    } // else remains false
    return isInEffect;
  }

  // The result returned by this method can be understood as
  // "I can use this cooldown starting from `overLap` to the right of now"
  // e.g. prev = 15, recast = 30, now = 50
  //      prev + recast - now = -5, meaning I can re-use from 45 at the earliest
  int _overlapPrev(int now) {
    int overlap = 0 - now;
    int prev = _history.lastKeyBefore(now);
    if (prev != null) {
      overlap = prev + recast.inSeconds - now;
    }
    return overlap;
  }

  int _overlapNext(int now) {
    int overlap = now - 720; // enrage at 12 minutes
    int next = _history.firstKeyAfter(now);
    print('debug $name next = $next');
    if (next != null) {
      overlap = now - (next - recast.inSeconds);
    }
    return overlap;
  }

  Ability activate({@required int time}) {
    if (isValidActivationTime(time: time)) {
      _history[time] = true;
      return this;
    } else
      throw new ArgumentError('Invalid ability activation time: $time');
  }

  Ability deactivate({@required int time}) {
    if (isInHistory(time: time)) {
      _history.remove(time);
      return this;
    } else
      throw new ArgumentError('Invalid ability deactivation time: $time');
  }
}

// ------------------------------------------

class AbilityWidget extends StatefulWidget {
  final Ability ability;
  final int now;

  AbilityWidget({@required this.ability, @required this.now});

  @override
  _AbilityWidgetState createState() => new _AbilityWidgetState();
}

class _AbilityWidgetState extends State<AbilityWidget> {
  @override
  Widget build(BuildContext context) {
    final Ability ability = widget.ability;
    final int now = widget.now;
    final int wait = ability._overlapPrev(now);
    final int hurry = ability._overlapNext(now);
    print(
        '${ability.name}: now = $now, overlapPrev = $wait, overlapNext = ${ability._overlapNext(now)}');
    return new Container(
      height: 64.0,
      child: new Column(
        children: <Widget>[
          new CircleAvatar(
            backgroundImage: new AssetImage(ability.iconPath),
          ),
          new Row(
            children: <Widget>[
              ability.isValidActivationTime(time: now)
                  ? new Icon(Icons.check)
                  : new Icon(Icons.timer),
              ability.isValidActivationTime(time: now)
                  ? new Text('')
                  : new Text('${wait.toString()}s'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// ------------------------------------------

class DetailedAbilityWidget extends StatelessWidget {
  final Ability ability;
  DetailedAbilityWidget({@required this.ability});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new CircleAvatar(),
                  new Column(
                    children: <Widget>[
                      new Text(
                        ability.name,
                        style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      new CircleAvatar(backgroundImage: AssetImage(ability.iconPath)),
                    ],
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Icon(Icons.timer_3),
                  new Text(ability.duration.toString()),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Icon(Icons.history),
                  new Text(ability.recast.inSeconds.toString())
                ],
              ),
            ],
          ),
          new Text(ability.effect),
        ],
      ),
    );
  }
}
