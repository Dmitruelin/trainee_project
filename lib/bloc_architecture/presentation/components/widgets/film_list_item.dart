import 'package:flutter/material.dart';
import 'package:trainee_project/bloc_architecture/presentation/screen_builder/bloc_screen_builder.dart';

import '../../../data/models/film_dto_model.dart';
import '../../ui/screens/details_film_screen.dart';

class ItemListFilm extends StatefulWidget {
  final List<Film> filmsList;

  const ItemListFilm({
    Key? key,
    required this.filmsList,
  }) : super(key: key);

  @override
  State<ItemListFilm> createState() => _ItemListFilmState();
}

class _ItemListFilmState extends State<ItemListFilm> {
  int _selectedIndex = -1;

  _isSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.filmsList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: InkWell(
              highlightColor: Colors.green,
              onTap: () {
                movieIdSelector.value = widget.filmsList[index].id;
                _isSelected(index);
                if (MediaQuery.of(context).orientation ==
                    Orientation.portrait) {
                  Navigator.pushNamed(
                    context,
                    DetailsFilmScreen.routeName,
                    arguments: widget.filmsList[index].id,
                  );
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
                      'assets/images/' + widget.filmsList[index].imagePath),
                ),
              ),
            ),
          );
        });
  }
}
