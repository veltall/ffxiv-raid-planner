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

  Event({
    @required this.time,
    @required this.title,
    @required this.res,
    @required this.desc,
  });
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
    // convert time to presentation format
    int time = widget.event.time;
    Duration temp = new Duration(seconds: time);
    String minute = temp.inMinutes.toString().padLeft(2,'0');
    String seconds = (temp.inSeconds % 60).toString().padLeft(2,'0');
    String timeStamp = minute + ":" + seconds;

    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            height: 64.0,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleAvatar(
                  child: new Icon(avatar),
                  backgroundColor: (widget.event.title == "Raidwide")
                      ? Colors.amber
                      : Colors.transparent,
                  foregroundColor: (widget.event.title == "Raidwide")
                      ? Colors.white
                      : Colors.red,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
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
                      Row(
                        children: <Widget>[
                          // new Icon(Icons.av_timer),
                          // new Icon(Icons.timer),
                          new Icon(Icons.access_time, color: Colors.grey, size: 20.0),
                          new Text(
                            timeStamp.padLeft(6,' '),
                            style: new TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ],
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
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }
}