import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit()
      : super(ThemeData(
          brightness: Brightness.dark,
          fontFamily: "Poppins",
        ));

  void toggleTheme() {
    if (state.brightness == Brightness.dark) {
      emit(ThemeData(
        brightness: Brightness.light,
        fontFamily: "Poppins",
      ));
    } else {
      emit(ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Poppins",
      ));
    }
  }
}
