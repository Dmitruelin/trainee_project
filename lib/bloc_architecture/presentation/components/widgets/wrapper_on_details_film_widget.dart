import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/widgets/details_film_widget.dart';

import '../../../bloc/films_details_cubit/film_details_cubit.dart';
import '../../../data/repository/network_repository_implementation.dart';

class WrapperOnDetailsFilmWidget extends StatelessWidget {
  final int filmId;

  const WrapperOnDetailsFilmWidget({
    Key? key,
    required this.filmId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FilmDetailsCubit>(
        create: (_) => FilmDetailsCubit(NetworkRepositoryImplementation()),
        child: DetailsFilmWidget(
          filmId: filmId,
        ));
  }
}
