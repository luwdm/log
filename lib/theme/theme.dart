import 'package:material_ui/material_ui.dart';

ThemeData get theme => ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    dynamicSchemeVariant: .monochrome,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: .circular(16)),
    filled: true,
  ),
  appBarTheme: const AppBarTheme(leadingWidth: 48, titleSpacing: 4),
);
