import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/mappers/json_mapper.dart';

import '../../data/models/film_dto_model.dart';
import '../../data/models/film_network_model.dart';
import '../../data/repository/repository.dart';

part 'films_list_state.dart';

class FilmsCubit extends Cubit<FilmListState> {
  final Repository _repository;

  FilmsCubit(this._repository) : super(InitialState());

  static const String _cashedData = 'CACHED_DATA';

  void onInitWidget() async {
    try {
      List<Film> _filmList = await _getFilmsFromCache();
      if (_filmList.isEmpty) {
        _filmList = await _repository.getFilmList();
        _postDataToCacheFromNetwork(_filmList);
      }

      emit(LoadedState(filmList: _filmList));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  void onPullToRefresh() async {
    try {
      _clearCacheData(_cashedData);
      List<Film> _filmList = await _repository.refreshFilmList();
      final _refreshedFilmList = List<Film>.from(_filmList.reversed);
      emit(LoadedState(filmList: _refreshedFilmList));
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Film>> _getFilmsFromCache() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final jsonFilmList = sharedPreferences.getStringList(_cashedData);

    if (jsonFilmList != null && jsonFilmList.isNotEmpty) {
      return List<Film>.from(JsonMapper.fromJsonListString(jsonFilmList));
    }

    return [];
  }

  Future<void> _postDataToCacheFromNetwork(List<Film> filmList) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final List<FilmNetworkModel> _filmNetworkModelList =
        List<FilmNetworkModel>.from(filmList);
    final List<String> jsonFilmList =
        JsonMapper.toJsonListString(_filmNetworkModelList);
    await sharedPreferences.setStringList(_cashedData, jsonFilmList);
  }

  Future<void> _clearCacheData(String key) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    await sharedPreferences.clear();
  }
}
