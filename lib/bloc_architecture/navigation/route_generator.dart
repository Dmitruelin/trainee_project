import 'package:flutter/material.dart';
import 'package:trainee_project/bloc_architecture/presentation/screen_builder/bloc_screen_builder.dart';
import 'package:trainee_project/bloc_architecture/presentation/ui/screens/details_film_screen.dart';
import 'package:trainee_project/bloc_architecture/presentation/ui/screens/main_screen.dart';
import 'package:trainee_project/mvvm_architecture/presentation/screen_builder/mvvm_screen_builder.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case MainScreen.routeName:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case BlocScreenBuilder.routeName:
        return MaterialPageRoute(builder: (_) => const BlocScreenBuilder());
      case MvvmScreenBuilder.routeName:
        return MaterialPageRoute(builder: (_) => const MvvmScreenBuilder());
      case DetailsFilmScreen.routeName:
        if (args is int) {
          return MaterialPageRoute(
              builder: (_) => DetailsFilmScreen(
                    filmId: args,
                  ));
        } else {
          return _errorArgumentsRoute();
        }

      default:
        return MaterialPageRoute(builder: (_) => const MainScreen());
    }
  }

  static Route<dynamic> _errorArgumentsRoute() {
    throw Exception('Wrong type of Arguments through passing to Route!');
  }
}
