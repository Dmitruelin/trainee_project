part of 'film_details_cubit.dart';

abstract class FilmsDetailsState {}

class InitialState extends FilmsDetailsState {}

class LoadedState extends FilmsDetailsState {
  final Film film;

  LoadedState({required this.film});
}

class ErrorState extends FilmsDetailsState {}
