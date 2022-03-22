import 'package:trainee_project/bloc_architecture/data/models/film_dto_model.dart';

class FilmNetworkModel extends Film {
  final int filmId;
  final String filmName;
  final String filmDescription;
  final String filmImagePath;

  FilmNetworkModel({
    required this.filmId,
    required this.filmName,
    required this.filmDescription,
    required this.filmImagePath,
  }) : super(
    id: filmId,
    name: filmName,
    description: filmDescription,
    imagePath: filmImagePath,
  );

  factory FilmNetworkModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final id = json['id'];
    final description = json['description'];
    final imagePath = json['imagePath'];
    return FilmNetworkModel(
      filmName: name,
      filmId: id,
      filmDescription: description,
      filmImagePath: imagePath,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['description'] = description;
    data['imagePath'] = imagePath;
    return data;
  }
}
