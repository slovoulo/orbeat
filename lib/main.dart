import 'package:flutter/material.dart';
import 'package:orbeat/contstants/routes.dart';

///Orbeat is an app that uses a public API to show the names of Astronauts currently in space together with the name of the spacecraft they are in


void main() {
  runApp( Orbeat(router:OrbeatRouter()));
}

class Orbeat extends StatelessWidget {
  final OrbeatRouter router;
  const Orbeat({Key? key,required this.router}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orbeat',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: router.generateRoute,
    );
  }
}


