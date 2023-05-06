import 'package:flutter/material.dart';

class EdadNombre extends ChangeNotifier {
  String edadnombre = '';

  void nombreedad(String genero, int edad) {
    if (edad >= 18) {
      edadnombre = "ADULTO";
    } else {
      if (genero == "hombre") {
        edadnombre = "NIÑO";
      } else {
        edadnombre = "NIÑA";
      }
    }
    notifyListeners();
  }
}
