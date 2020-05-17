import 'package:flutter/widgets.dart';
import 'package:test_0/component/cinema_list.dart';

class CinemaPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CinemaPageState();
  }
}

class _CinemaPageState extends State<CinemaPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return CinemaList();
  }
}
