import 'package:trainee_project/bloc_architecture/data/repository/repository.dart';

import '../models/film_dto_model.dart';

class HardcodedRepositoryImplementation implements Repository {
  final List<Film> _filmList = [
    Film(
      description: 'Film number one',
      name: 'Film1',
      imagePath: 'blackwidow_38.jpg',
      id: 1,
    ),
    Film(
      description: 'Film number two',
      name: 'Film2',
      imagePath: 'cashtruck_1.jpg',
      id: 2,
    ),
    Film(
      description: 'Film number three',
      name: 'Film3',
      imagePath: 'freeguy_8.jpg',
      id: 3,
    ),
    Film(
      description: 'Film number four',
      name: 'Film4',
      imagePath: 'mortalcombat_5.jpg',
      id: 4,
    ),
    Film(
      description: 'Film number five',
      name: 'Film5',
      imagePath: 'venom2_20.jpg',
      id: 5,
    ),
    Film(
      description: 'Film number six',
      name: 'Film6',
      imagePath: 'kapitanmarvel_30.jpg',
      id: 6,
    ),
    Film(
      description: 'Film number seven',
      name: 'Film7',
      imagePath: 'kapitanmarvel_29.jpg',
      id: 7,
    ),
  ];

  @override
  Future<List<Film>> getFilmList() async {
    return _filmList;
  }

  @override
  Future<Film> getFilmById(int filmId) async {
    final Film _film = _filmList.firstWhere((element) => element.id == filmId);
    return _film;
  }

  @override
  Future<List<Film>> refreshFilmList() async {
    final _refreshedFilmList = List<Film>.from(_filmList.reversed);
    return _refreshedFilmList;
  }
}
