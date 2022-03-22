import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_project/bloc_architecture/bloc/films_list_cubit/films_list_cubit.dart';
import 'package:trainee_project/bloc_architecture/data/repository/network_repository_implementation.dart';

import '../../../../mvvm_architecture/presentation/screen_builder/mvvm_screen_builder.dart';
import '../../screen_builder/bloc_screen_builder.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = '/main_screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider<FilmsCubit>(
                        create: (_) =>
                            FilmsCubit(NetworkRepositoryImplementation()),
                        child: const BlocScreenBuilder());
                  }));
                },
                child: const Text('BloC')),
            ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, MvvmScreenBuilder.routeName),
                child: const Text('MVVM')),
          ],
        ),
      ),
    );
  }
}
