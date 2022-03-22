import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/widgets/film_list_item.dart';

import '../../../bloc/films_list_cubit/films_list_cubit.dart';

class ListFilmWidget extends StatelessWidget {
  const ListFilmWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilmsCubit, FilmListState>(builder: (context, state) {
      if (state is InitialState) {
        context.read<FilmsCubit>().onInitWidget();
        return const Center(child: CircularProgressIndicator());
      } else if (state is LoadedState) {
        return ItemListFilm(
          filmsList: state.filmList,
        );
      } else {
        return Container();
      }
    });
  }
}
