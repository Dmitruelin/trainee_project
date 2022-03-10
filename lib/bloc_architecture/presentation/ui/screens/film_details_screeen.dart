import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/films_details_cubit/film_details_cubit.dart';

class FilmDetailsScreen extends StatelessWidget {
  final bool hasCameFromLandscapeOrientation;
  const FilmDetailsScreen(
      {Key? key, required this.hasCameFromLandscapeOrientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape &&
        hasCameFromLandscapeOrientation == true) {
      Navigator.pop(context);
    }

    return BlocBuilder<FilmDetailsCubit, FilmsDetailsState>(
        builder: (context, state) {
      if (state is InitialState) {
        return const Center(child: Text('No film selected'));
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
      } else if (state is ErrorState) {
        throw (Exception('Error'));
      } else {
        return Container();
      }
    });
  }
}
