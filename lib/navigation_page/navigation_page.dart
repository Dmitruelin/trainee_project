import 'package:flutter/material.dart';
import 'package:trainee_project/bloc_architecture/navigation/route_generator.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
