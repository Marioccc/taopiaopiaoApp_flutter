import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SeatComponent extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool saled;
  SeatComponent({this.saled, @required this.onChanged});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SeatState(saled: saled, onChanged: onChanged);
  }
}

class _SeatState extends State<SeatComponent> {
  final ValueChanged<bool> onChanged;
  final bool saled;
  _SeatState({this.saled, @required this.onChanged});
  bool _status = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: _status ? Colors.blue[200] : Colors.green[300],
      icon: Icon(Icons.weekend),
      onPressed: saled
          ? null
          : () {
              setState(() {
                _status = !_status;
              });
              onChanged(_status);
            },
    );
  }
}
