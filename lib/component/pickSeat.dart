import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_0/component/seat.dart';

class PickSeatComponent extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  PickSeatComponent(this.onChanged);
  _PickSeatComponentState createState() => _PickSeatComponentState(onChanged);
}

class _PickSeatComponentState extends State<PickSeatComponent> {
  final ValueChanged<bool> onChanged;
  _PickSeatComponentState(this.onChanged);
  List<Widget> buildContent() {
    List<Widget> _items = [];
    bool isSaled = false;
    for (var i = 0; i < 40; i++) {
      int num = Random().nextInt(10);
      num <= 2 ? isSaled = true : isSaled = false;
      _items.add(SeatComponent(
        saled: isSaled,
        onChanged: onChanged,
      ));
    }
    return _items;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 0.9,
      spacing: 0.1,
      children: buildContent(),
    );
  }
}
