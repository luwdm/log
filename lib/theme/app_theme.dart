import 'package:material_ui/material_ui.dart';

ThemeData get theme {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    dynamicSchemeVariant: .vibrant,
  );

  return ThemeData(
    colorScheme: colorScheme,
    inputDecorationTheme: colorScheme.inputDecorationTheme,
    appBarTheme: const AppBarTheme(leadingWidth: 48, titleSpacing: 4),
  );
}

extension on ColorScheme {
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: primary),
      borderRadius: .circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: error),
      borderRadius: .circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: outline),
      borderRadius: .circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: error),
      borderRadius: .circular(12),
    ),
    filled: true,
  );
}
