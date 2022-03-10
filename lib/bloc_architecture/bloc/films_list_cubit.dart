import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/film.dart';
import '../data/repository/repository.dart';

class FilmsCubit extends Cubit<List<Film>> {
  final Repository _repository;

  Repository get repository => _repository;

  FilmsCubit(this._repository) : super([]);

  void getFilmsList() async {
    List<Film> filmsList = await _repository.getFilmList();
    emit(filmsList);
  }
}
