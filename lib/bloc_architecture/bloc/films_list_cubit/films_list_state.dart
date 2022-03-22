part of 'films_list_cubit.dart';

abstract class FilmListState {}

class InitialState extends FilmListState {}

class LoadedState extends FilmListState {
  final List<Film> filmList;

  LoadedState({required this.filmList});
}
