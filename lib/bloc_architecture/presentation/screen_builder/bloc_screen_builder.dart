import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trainee_project/bloc_architecture/bloc/films_list_cubit/films_list_cubit.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/widgets/list_film_widget.dart';
import 'package:trainee_project/bloc_architecture/presentation/components/widgets/wrapper_on_details_film_widget.dart';
import 'package:trainee_project/bloc_architecture/presentation/ui/screens/list_film_screen.dart';

class BlocScreenBuilder extends StatefulWidget {
  static const String routeName = '/bloc_screen_builder';

  const BlocScreenBuilder({Key? key}) : super(key: key);

  @override
  State<BlocScreenBuilder> createState() => _BlocScreenBuilderState();
}

final ValueNotifier<int> movieIdSelector = ValueNotifier(0);

class _BlocScreenBuilderState extends State<BlocScreenBuilder> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
      onRefresh: () async {
        context.read<FilmsCubit>().onPullToRefresh();
        await Future.delayed(const Duration(seconds: 1));
      },
      child: OrientationBuilder(builder: (context, orientation) {
        if (orientation == Orientation.landscape) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Films list with details'),
              centerTitle: true,
            ),
            body: Row(children: [
              const Flexible(
                flex: 1,
                child: ListFilmWidget(),
              ),
              const VerticalDivider(
                color: Colors.blueGrey,
                thickness: 2,
              ),
              Flexible(
                flex: 2,
                child: ValueListenableBuilder(
                  valueListenable: movieIdSelector,
                  builder: (BuildContext context, int value, _) {
                    return WrapperOnDetailsFilmWidget(filmId: value);
                  },
                ),
              ),
            ]),
          );
        } else {
          return const ListFilmScreen();
        }
      }),
    );
  }
}
