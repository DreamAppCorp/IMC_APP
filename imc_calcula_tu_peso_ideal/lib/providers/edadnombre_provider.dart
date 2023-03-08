import 'package:flutter/material.dart';

class EdadNombre extends ChangeNotifier {
  String edadnombre = '';

  void nombreedad(String genero, int edad) {
    if (edad >= 18) {
      edadnombre = "Adulto";
    } else {
      if (genero == "hombre") {
        edadnombre = "Niño";
      } else {
        edadnombre = "Niña";
      }
    }
    notifyListeners();
  }
}
