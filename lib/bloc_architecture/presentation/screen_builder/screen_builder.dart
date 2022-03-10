import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../ui/screens/film_details_screeen.dart';
import '../ui/screens/film_list_screen.dart';
import 'clear_detail_screen_state_widget.dart';

class ScreenBuilder extends StatefulWidget {
  final bool isBlocSelected;

  const ScreenBuilder({Key? key, required this.isBlocSelected})
      : super(key: key);

  @override
  State<ScreenBuilder> createState() => _ScreenBuilderState();
}

class _ScreenBuilderState extends State<ScreenBuilder> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      return ClearDetailScreenStateWidget(
        appBarTitle: 'Films list with details',
        body: Row(children: [
          Expanded(
            flex: 1,
            child: FilmListScreen(isBlocSelected: widget.isBlocSelected),
          ),
          const Expanded(
            child: FilmDetailsScreen(hasCameFromLandscapeOrientation: false),
            flex: 2,
          ),
        ]),
      );
    } else {
      return ClearDetailScreenStateWidget(
          appBarTitle: 'Films list',
          body: FilmListScreen(isBlocSelected: widget.isBlocSelected));
    }
  }
}
