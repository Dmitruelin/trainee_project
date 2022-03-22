import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MvvmScreenBuilder extends StatefulWidget {
  static const String routeName = '/mvvm_screen_builder';

  const MvvmScreenBuilder({Key? key}) : super(key: key);

  @override
  State<MvvmScreenBuilder> createState() => _MvvmScreenBuilderState();
}

class _MvvmScreenBuilderState extends State<MvvmScreenBuilder> {
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Films list'),
          centerTitle: true,
        ),
        body: Row(children: const [Expanded(flex: 1, child: Text('Mvvm'))]));
  }
}
