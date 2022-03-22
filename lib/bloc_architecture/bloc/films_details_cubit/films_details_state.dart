part of 'film_details_cubit.dart';

abstract class FilmDetailsState extends Equatable {}

class InitialState extends FilmDetailsState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends FilmDetailsState{
  @override

  List<Object?> get props => [];

}

class LoadedState extends FilmDetailsState {
  final Film film;

  LoadedState({required this.film});

  @override
  List<Object?> get props => [film];
}
