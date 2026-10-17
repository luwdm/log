import 'package:material_ui/material_ui.dart';

ThemeData get theme => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: .circular(16)),
    filled: true,
  ),
);
