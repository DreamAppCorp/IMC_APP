import 'package:flutter/material.dart';

class PesoProvider extends ChangeNotifier {
  String msg = '-';
  double imc = 0;
  double val_move = 0.0;

  void mensajeIMC(double peso, double estatura, int edad) {
//IMC = peso (kg)/ estatura (m2) y,
    double estatura2 = estatura / 100;
    final resultadoIMC = peso / (estatura2 * estatura2);
    imc = double.parse(resultadoIMC.toStringAsFixed(2));
    print(resultadoIMC);
    if (edad >= 18) {
      if (resultadoIMC < 16) {
        msg = 'DELGADEZ MUY EXTREMA';
      } else if (resultadoIMC >= 17 && resultadoIMC <= 16.9) {
        msg = 'DELGADEZ EXTREMA';
      } else if (resultadoIMC >= 17 && resultadoIMC <= 18.4) {
        msg = 'DELGADEZ';
      } else if (resultadoIMC >= 18.5 && resultadoIMC <= 24.9) {
        msg = 'PESO NORMAL';
        val_move = 100.00;
      } else if (resultadoIMC >= 25.0 && resultadoIMC <= 29.9) {
        msg = 'SOBREPESO';
      } else if (resultadoIMC >= 30.0 && resultadoIMC <= 34.9) {
        msg = 'OBESIDAD I';
      } else if (resultadoIMC >= 35.0 && resultadoIMC <= 39.9) {
        msg = 'OBESIDAD II';
      } else {
        msg = 'OBESIDAD III';
      }
    } else {
      if (resultadoIMC < 11.7) {
        msg = 'Desnutricion severa';
      } else if (resultadoIMC >= 11.8 && resultadoIMC <= 12.6) {
        msg = 'Desnutricion moderada';
      } else if (resultadoIMC >= 12.7 && resultadoIMC <= 17) {
        msg = 'Normal';
        val_move = -200;
      } else if (resultadoIMC >= 17.1 && resultadoIMC <= 19.2) {
        msg = 'Sobrepeso';
      } else {
        msg = 'Obesidad';
      }
    }
    print(msg);
    notifyListeners();
  }

//   void getCategoriaxIMC(double peso, double estatura) {
// //IMC = peso (kg)/ estatura (m2) y,
//     double estatura2 = estatura / 100;
//     final resultadoIMC = peso / (estatura2 * estatura2);
//     imc = double.parse(resultadoIMC.toStringAsFixed(2));
//     print(resultadoIMC);

//     if (resultadoIMC < 16) {
//       msg = 'Delgadez muy extrema';
//     } else if (resultadoIMC >= 17 && resultadoIMC <= 16.9) {
//       msg = 'Delgadez extrema';
//     } else if (resultadoIMC >= 17 && resultadoIMC <= 18.4) {
//       msg = 'Delgadez';
//     } else if (resultadoIMC >= 18.5 && resultadoIMC <= 24.9) {
//       msg = 'Normal';
//     } else if (resultadoIMC >= 25.0 && resultadoIMC <= 29.9) {
//       msg = 'Sobrepeso';
//     } else if (resultadoIMC >= 30.0 && resultadoIMC <= 34.9) {
//       msg = 'Obesidad I';
//     } else if (resultadoIMC >= 35.0 && resultadoIMC <= 39.9) {
//       msg = 'Obesidad II';
//     } else {
//       msg = 'Obesidad III';
//     }

//     notifyListeners();
//   }
}
