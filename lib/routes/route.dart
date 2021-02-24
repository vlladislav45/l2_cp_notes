import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:l2_notes/logic/cubit/category_cubit.dart';
import 'package:l2_notes/widgets/home_page.dart';

class AppRouter {
final CharacterCubit _characterCubit = CharacterCubit();

Route onGenerateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _characterCubit,
            child: HomePage(),
          ));
      break;
    default:
      return null;
  }
}

void dispose() {
  _characterCubit.close();
}
}