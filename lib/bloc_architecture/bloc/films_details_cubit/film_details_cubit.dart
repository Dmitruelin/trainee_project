import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/film.dart';

part 'films_details_state.dart';

class FilmDetailsCubit extends Cubit<FilmsDetailsState> {
  FilmDetailsCubit() : super(InitialState());

  void goToDetailsScreen(Film film) => emit(LoadedState(film: film));

  void clearState() => emit(InitialState());
}
