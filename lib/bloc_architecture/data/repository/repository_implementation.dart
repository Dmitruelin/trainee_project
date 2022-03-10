import 'package:trainee_project/bloc_architecture/data/repository/repository.dart';

import '../models/film.dart';

class RepositoryImplementation implements Repository {
  final List<Film> _filmList = [
    Film(
      description: 'Film number one',
      name: 'Film1',
      imagePath: 'blackwidow_38.jpg',
    ),
    Film(
      description: 'Film number two',
      name: 'Film2',
      imagePath: 'cashtruck_1.jpg',
    ),
    Film(
      description: 'Film number three',
      name: 'Film3',
      imagePath: 'freeguy_8.jpg',
    ),
    Film(
      description: 'Film number four',
      name: 'Film4',
      imagePath: 'mortalcombat_5.jpg',
    ),
    Film(
      description: 'Film number five',
      name: 'Film5',
      imagePath: 'venom2_20.jpg',
    ),
    Film(
      description: 'Film number six',
      name: 'Film6',
      imagePath: 'kapitanmarvel_30.jpg',
    ),
    Film(
      description: 'Film number seven',
      name: 'Film7',
      imagePath: 'kapitanmarvel_29.jpg',
    ),
  ];

  @override
  Future<List<Film>> getFilmList() async {
    return _filmList;
  }
}
