import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_architecture/bloc/films_details_cubit/film_details_cubit.dart';
import '../bloc_architecture/bloc/films_list_cubit.dart';
import '../bloc_architecture/data/repository/repository_implementation.dart';
import '../bloc_architecture/presentation/ui/screens/main_screen.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<FilmsCubit>(
          create: (_) => FilmsCubit(RepositoryImplementation()),
        ),
        BlocProvider<FilmDetailsCubit>(
          create: (_) => FilmDetailsCubit(),
        ),
      ],
      child: const MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}
