import 'dart:convert';

import '../../../data/models/film_network_model.dart';

class JsonMapper {
  static toJsonListString(List<dynamic> _list) {
    return _list.map((film) => jsonEncode(film.toJson())).toList();
  }

  static fromJsonListString(json) {
    return json
        .map((film) => FilmNetworkModel.fromJson(jsonDecode(film)))
        .toList();
  }

  static fromJsonDecode(json) {
    return json.map((film) => FilmNetworkModel.fromJson(film)).toList();
  }
}
