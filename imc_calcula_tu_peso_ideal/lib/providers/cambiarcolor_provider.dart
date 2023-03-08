import 'package:flutter/material.dart';

class CambiarColorProvider extends ChangeNotifier {
  Color colorido = const Color.fromARGB(255, 15, 255, 3);
  Color colorido2 = const Color.fromARGB(255, 150, 246, 145);

//   void cambiamosdecolor(String mensaje) {
// //IMC = peso (kg)/ estatura (m2) y,
//     switch (mensaje) {
//       case 'Delgadez muy extrema':
//         colorido = const Color.fromARGB(255, 0, 60, 255);
//         colorido2 = const Color.fromARGB(255, 124, 153, 249);

//         break;
//       case 'Delgadez extrema':
//         colorido = const Color.fromARGB(255, 42, 91, 255);
//         colorido2 = const Color.fromARGB(255, 166, 186, 250);

//         break;
//       case 'Delgadez':
//         colorido = const Color.fromARGB(255, 119, 150, 249);
//         colorido2 = const Color.fromARGB(255, 223, 230, 255);

//         break;
//       case 'Normal':
//         colorido = const Color.fromARGB(255, 0, 254, 0);
//         colorido2 = const Color.fromARGB(255, 150, 246, 145);

//         break;
//       case 'Sobrepeso':
//         colorido = const Color.fromARGB(255, 255, 238, 55);
//         colorido2 = const Color.fromARGB(255, 252, 243, 137);

//         break;
//       case 'Obesidad I':
//         colorido = const Color.fromARGB(255, 249, 142, 2);
//         colorido2 = const Color.fromARGB(255, 255, 215, 163);

//         break;
//       case 'Obesidad II':
//         colorido = const Color.fromARGB(255, 246, 36, 17);
//         colorido = const Color.fromARGB(255, 251, 182, 176);

//         break;
//       case 'Obesidad III':
//         colorido = const Color.fromARGB(255, 108, 0, 0);
//         colorido = const Color.fromARGB(255, 124, 80, 80);

//         break;
//     }

//     notifyListeners();
//   }

  void cambiamosdecolor2(String mensaje, int edad) {
    if (edad >= 18) {
      switch (mensaje) {
        case 'Delgadez muy extrema':
          colorido = const Color.fromARGB(255, 0, 60, 255);
          colorido2 = const Color.fromARGB(255, 124, 153, 249);

          break;
        case 'Delgadez extrema':
          colorido = const Color.fromARGB(255, 42, 91, 255);
          colorido2 = const Color.fromARGB(255, 166, 186, 250);

          break;
        case 'Delgadez':
          colorido = const Color.fromARGB(255, 119, 150, 249);
          colorido2 = const Color.fromARGB(255, 223, 230, 255);

          break;
        case 'Normal':
          colorido = const Color.fromARGB(255, 0, 254, 0);
          colorido2 = const Color.fromARGB(255, 150, 246, 145);

          break;
        case 'Sobrepeso':
          colorido = const Color.fromARGB(255, 255, 238, 55);
          colorido2 = const Color.fromARGB(255, 252, 243, 137);

          break;
        case 'Obesidad I':
          colorido = const Color.fromARGB(255, 249, 142, 2);
          colorido2 = const Color.fromARGB(255, 255, 215, 163);

          break;
        case 'Obesidad II':
          colorido = const Color.fromARGB(255, 246, 36, 17);
          colorido = const Color.fromARGB(255, 251, 182, 176);

          break;
        case 'Obesidad III':
          colorido = const Color.fromARGB(255, 108, 0, 0);
          colorido = const Color.fromARGB(255, 124, 80, 80);

          break;
      }
    } else {
      switch (mensaje) {
        case 'Desnutricion severa':
          colorido = const Color.fromARGB(255, 255, 0, 0);
          colorido2 = const Color.fromARGB(255, 255, 76, 26);

          break;
        case 'Desnutricion moderada':
          colorido = const Color.fromARGB(255, 255, 193, 5);
          colorido2 = const Color.fromARGB(255, 251, 255, 25);

          break;

        case 'Normal':
          colorido = const Color.fromARGB(255, 0, 254, 0);
          colorido2 = const Color.fromARGB(255, 150, 246, 145);

          break;
        case 'Sobrepeso':
          colorido = const Color.fromARGB(255, 243, 10, 255);
          colorido2 = const Color.fromARGB(255, 245, 158, 248);

          break;
        case 'Obesidad':
          colorido = const Color.fromARGB(255, 137, 3, 147);
          colorido2 = const Color.fromARGB(255, 255, 68, 227);

          break;
      }
    }
    notifyListeners();
  }
}
