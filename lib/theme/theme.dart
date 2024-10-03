import 'package:flutter/material.dart';

ThemeData get theme => ThemeData(
      colorScheme: ColorScheme.light(
        primary: Colors.black,
        secondary: Colors.grey.shade200,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
