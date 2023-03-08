import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkMode})
      : currentTheme = isDarkMode
            ? ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme(
                    brightness: Brightness.light,
                    primary: Color.fromARGB(255, 236, 249, 6),
                    onPrimary: Color.fromARGB(255, 40, 250, 250),
                    secondary: Color.fromARGB(255, 141, 135, 244),
                    onSecondary: Color.fromARGB(255, 236, 29, 255),
                    error: Colors.red,
                    onError: Color.fromARGB(255, 236, 29, 255),
                    background: Color.fromARGB(255, 2, 0, 42),
                    onBackground: Colors.white,
                    surface: Color.fromARGB(255, 2, 0, 42),
                    onSurface: Colors.white))
            : ThemeData(
                useMaterial3: true, colorScheme: const ColorScheme.light());
  setClaro() {
    currentTheme =
        ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light());
    notifyListeners();
  }

  setOscuro() {
    currentTheme =
        ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark());
    notifyListeners();
  }

  setColorQ() {
    currentTheme = ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Color.fromARGB(255, 236, 249, 6),
            onPrimary: Color.fromARGB(255, 40, 250, 250),
            secondary: Color.fromARGB(255, 141, 135, 244),
            onSecondary: Color.fromARGB(255, 236, 29, 255),
            error: Colors.red,
            onError: Color.fromARGB(255, 236, 29, 255),
            background: Color.fromARGB(255, 2, 0, 42),
            onBackground: Colors.white,
            surface: Color.fromARGB(255, 2, 0, 42),
            onSurface: Colors.white));
    notifyListeners();
  }
}
