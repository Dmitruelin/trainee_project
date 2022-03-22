import '../models/film_dto_model.dart';

abstract class Repository {
  Future<List<Film>> getFilmList();

  Future<List<Film>> refreshFilmList();

  Future<Film> getFilmById(int filmId);
}
