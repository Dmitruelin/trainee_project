import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/films_details_cubit/film_details_cubit.dart';

class ClearDetailScreenStateWidget extends StatelessWidget {
  final String appBarTitle;
  final Widget body;

  const ClearDetailScreenStateWidget({
    Key? key,
    required this.appBarTitle,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<FilmDetailsCubit>().clearState();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          centerTitle: true,
        ),
        body: body,
      ),
    );
  }
}
