import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/films_details_cubit/film_details_cubit.dart';

class DetailsFilmWidget extends StatelessWidget {
  final int filmId;

  const DetailsFilmWidget({
    Key? key,
    required this.filmId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (filmId == 0) {
      return const Center(child: Text('No film selected'));
    } else {
      context.read<FilmDetailsCubit>().onItemListTap(filmId);
      return BlocBuilder<FilmDetailsCubit, FilmDetailsState>(
          builder: (context, state) {
        if (state is InitialState) {
          return const Center(child: Text('No film selected'));
        } else if (state is LoadingState) {
          return const Center (child:CircularProgressIndicator());
        } else if (state is LoadedState) {
          return Center(
              child: Column(children: [
            Text(
              state.film.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            SizedBox(
                height: 200,
                child: Card(
                  child: Image.asset('assets/images/' + state.film.imagePath),
                )),
            Text(
              state.film.description,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
          ]));
        } else {
          return Container();
        }
      });
    }
  }
}
