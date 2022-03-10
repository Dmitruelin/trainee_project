import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/films_list_cubit.dart';
import '../../screen_builder/screen_builder.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose architecture'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      context.read<FilmsCubit>().getFilmsList();
                      return const ScreenBuilder(isBlocSelected: true);
                    })),
                child: const Text('BloC')),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ScreenBuilder(isBlocSelected: false))),
                child: const Text('MVVM')),
          ],
        ),
      ),
    );
  }
}
