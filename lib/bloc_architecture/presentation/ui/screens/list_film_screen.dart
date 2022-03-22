import 'package:flutter/material.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/widgets/list_film_widget.dart';

class ListFilmScreen extends StatelessWidget {
  static const String routeName = '/list_film_screen';

  const ListFilmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Film list'),
          centerTitle: true,
        ),
        body: const ListFilmWidget());
  }
}
