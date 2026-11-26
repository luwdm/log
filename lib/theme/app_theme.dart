import 'package:material_ui/material_ui.dart';

ThemeData get lightTheme => _buildTheme(.light);

ThemeData get darkTheme => _buildTheme(.dark);

ThemeData _buildTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.blueAccent,
    brightness: brightness,
    dynamicSchemeVariant: .vibrant,
  );

  return ThemeData(
    colorScheme: colorScheme,
    inputDecorationTheme: colorScheme.inputDecorationTheme,
    filledButtonTheme: colorScheme.filledButtonTheme,
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

  FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(minimumSize: const Size(0, 50)),
  );
}
