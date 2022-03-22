import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trainee_project/bloc_architecture/data/models/film_dto_model.dart';
import 'package:trainee_project/bloc_architecture/data/repository/repository.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/mappers/json_mapper.dart';

class NetworkRepositoryImplementation implements Repository {
  final Dio dio = Dio();

  @override
  Future<List<Film>> getFilmList() => _getResponse();

  @override
  Future<List<Film>> refreshFilmList() => _getResponse();

  @override
  Future<Film> getFilmById(int filmId) async {
    List<Film> filmsList = await _getResponse();

    return filmsList.firstWhere((film) => film.id == filmId);
  }

  Future<List<Film>> _getResponse() async {
    final uri = Uri.https(
      'putsreq.com',
      '/NJwfYaSE7NkYs7oTUeKK',
    );
    try {
      final response = await dio.getUri(uri);

      if (response.statusCode != 200) {
        throw Exception('Failed to connect server');
      }

      return List<Film>.from(
          JsonMapper.fromJsonDecode(jsonDecode(response.data)));
    } on Error catch (_, e) {
      throw Exception(e);
    }
  }
}
