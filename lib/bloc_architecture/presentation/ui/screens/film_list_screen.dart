import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/films_details_cubit/film_details_cubit.dart';
import '../../../bloc/films_list_cubit.dart';
import '../../../data/models/film.dart';
import 'film_details_screeen.dart';

class FilmListScreen extends StatefulWidget {
  final bool isBlocSelected;

  const FilmListScreen({Key? key, required this.isBlocSelected})
      : super(key: key);

  @override
  State<FilmListScreen> createState() => _FilmListScreenState();
}

class _FilmListScreenState extends State<FilmListScreen> {
  int _selectedIndex = -1;

  _isSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isBlocSelected) {
      return BlocBuilder<FilmsCubit, List<Film>>(builder: (context, filmsList) {
        return ListView.builder(
            itemCount: filmsList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: InkWell(
                  highlightColor: Colors.green,
                  onTap: () {
                    context
                        .read<FilmDetailsCubit>()
                        .goToDetailsScreen(filmsList[index]);

                    if (MediaQuery.of(context).orientation ==
                        Orientation.landscape) {
                      if (_selectedIndex == index) {
                        context.read<FilmDetailsCubit>().clearState();
                        setState(() {
                          _selectedIndex = -1;
                        });
                      } else {
                        _isSelected(index);
                      }
                    } else {
                      _isSelected(index);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: Text(
                                        'Details of ${filmsList[index].name}'),
                                  ),
                                  body: const FilmDetailsScreen(
                                    hasCameFromLandscapeOrientation: true,
                                  ))));
                    }
                  },
                  child: Ink(
                    color: (_selectedIndex == index &&
                            MediaQuery.of(context).orientation ==
                                Orientation.landscape)
                        ? Colors.blue
                        : Colors.transparent,
                    child: Card(
                      elevation: 4,
                      child: Image.asset(
                          'assets/images/' + filmsList[index].imagePath),
                    ),
                  ),
                ),
              );
            });
      });
    } else {
      return const Center(
        child: Text('Mvvm'),
      );
    }
  }
}
