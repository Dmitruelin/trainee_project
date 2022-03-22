import 'package:flutter/material.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/widgets/wrapper_on_details_film_widget.dart';

class DetailsFilmScreen extends StatelessWidget {
  final int filmId;
  static const String routeName = '/details_film_screen';

  const DetailsFilmScreen({
    Key? key,
    required this.filmId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (orientation == Orientation.landscape) {
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          Navigator.pop(context);
        });
      }

      return Scaffold(
        appBar: AppBar(
          title: const Text('Details'),
          centerTitle: true,
        ),
        body: WrapperOnDetailsFilmWidget(filmId: filmId),
      );
    });
  }
}
