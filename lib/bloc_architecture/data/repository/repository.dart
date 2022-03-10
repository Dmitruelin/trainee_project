import '../models/film.dart';

abstract class Repository {
  Future<List<Film>> getFilmList();
}
