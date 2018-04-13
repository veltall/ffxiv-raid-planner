import 'response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

enum EventType { AUTO_ATTACK, TANK_BUSTER, RAIDWIDE, TARGETED }

class Event {
  // identity data
  final int time;
  final String title;
  final String desc;
  // EventType type;

  // functional data
  Response res;

  Event(
      {@required this.time,
      @required this.title,
      @required this.res,
      @required this.desc});
}

class EventWidget extends StatefulWidget {
  final Event event;

  EventWidget({@required this.event});

  @override
  _EventWidgetState createState() => new _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  IconData avatar;
  @override
  void initState() {
    avatar = _getAvatar();
    super.initState();
  }

  IconData _getAvatar() {
    IconData avatar = Icons.error;
    switch (widget.event.title) {
      case "Auto-Attack":
        avatar = Icons.loop;
        break;
      case "Tank-Buster":
        avatar = Icons.directions_bus;
        break;
      case "Raidwide":
        avatar = Icons.flare;
        break;
      case "Targeted":
        avatar = Icons.lens;
        break;
      default:
        break;
    }
    return avatar;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            height: 80.0,
            width: 350.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleAvatar(
                  child: new Icon(avatar),
                  backgroundColor: (widget.event.title == "Raidwide")
                    ? Colors.amber
                    : Colors.white,
                  foregroundColor: Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Text(
                        widget.event.title,
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      new Text(
                        widget.event.desc,
                        style: new TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          // new ListTile(
          //   leading: new CircleAvatar(
          //     child: new Icon(avatar),
          //   ),
          //   title: new Text(widget.event.title),
          //   subtitle: new Text(widget.event.desc),
          // ),
          new ResponseWidget(response: widget.event.res),
        ],
      ),
    );
    // return new ExpansionTile(
    //   title: new Text(widget.event.title),
    //   children: <Widget>[
    //     new ListTile(
    //       title: new Text(widget.event.time.toString()),
    //     ),
    //     new ListTile(
    //       title: new Text(widget.event.desc),
    //     ),
    //   ],
    // );
  }
}
