import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/film_dto_model.dart';
import '../../data/repository/repository.dart';

part 'films_details_state.dart';

class FilmDetailsCubit extends Cubit<FilmDetailsState> {
  final Repository _repository;

  FilmDetailsCubit(this._repository) : super(InitialState());

  void onItemListTap(int filmId) async {
    try {
      emit(LoadingState());
      Film film = await _repository.getFilmById(filmId);
      emit(LoadedState(film: film));
    } catch (e) {
      throw Exception(e);
    }
  }
}
