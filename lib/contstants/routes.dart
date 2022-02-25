import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orbeat/screens/home.dart';

import '../cubit/astronaut_cubit.dart';

class OrbeatRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) =>
            BlocProvider(
              create: (context) => AstronautCubit(),
              child: HomePage(),
            ));
      default:
        return null;
    }
  }
}