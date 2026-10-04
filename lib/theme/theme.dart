import 'package:material_ui/material_ui.dart';

ThemeData get theme => ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  // colorScheme: ColorScheme.light(
  //   primary: Colors.black,
  //   secondary: Colors.grey.shade200,
  // ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    filled: true,
    floatingLabelBehavior: .always,
  ),
);
