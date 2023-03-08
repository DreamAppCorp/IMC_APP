import 'package:flutter/material.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/cambiarcolor_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/edadnombre_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/peso_provider.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc_calcula_tu_peso_ideal/preferences/preferences.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/theme_provider.dart';

class IMCPAGE extends StatefulWidget {
  const IMCPAGE({super.key});

  @override
  State<IMCPAGE> createState() => _IMCPAGEState();
}

class _IMCPAGEState extends State<IMCPAGE> {
  final TextEditingController _edad = TextEditingController();
  final TextEditingController _peso = TextEditingController();
  final TextEditingController _altura = TextEditingController();

  Color colormujer = Colors.grey.shade300;
  Color colorhombre = Colors.grey.shade300;
  String genero = "";

  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
    final themacolor = Provider.of<ThemeProvider>(context, listen: false);
    final cambiarcolorProvider = Provider.of<CambiarColorProvider>(context);
    final cambiaredadnombre = Provider.of<EdadNombre>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMC',
          style: GoogleFonts.quicksand(
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.wb_sunny, size: 22),
                color: !Preferences.theme ? Colors.green : Colors.grey,
                onPressed: () {
                  setState(() {
                    Preferences.theme = false;
                  });
                  themacolor.setClaro();
                },
                visualDensity: VisualDensity.compact,
              ),
              IconButton(
                icon: const Icon(Icons.nightlight_round_outlined, size: 22),
                color: Preferences.theme ? Colors.green : Colors.grey,
                onPressed: () {
                  setState(() {
                    Preferences.theme = true;
                  });
                  themacolor.setColorQ();
                },
                visualDensity: VisualDensity.compact,
              ),
            ],
          )
          // Switch.adaptive(
          //     value: Preferences.theme,
          //     onChanged: (value) {
          //       Preferences.theme = value;
          //       final themeP =
          //           Provider.of<ThemeProvider>(context, listen: false);
          //       value ? themeP.setColorQ() : themeP.setClaro();
          //       setState(() {});
          //     }),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            children: [
                              Text(
                                'EDAD',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              TextField(
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                controller: _edad,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      top: 15), // Padding para el contenido
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          // height: MediaQuery.of(context).size.height * 0.12,
                          // width: MediaQuery.of(context).size.width * 0.078,

                          height: 75,
                          width: 40,
                          child: InkWell(
                            child: Image.asset(
                              'assets/icono_hombre.png',
                              color: colorhombre,
                            ),
                            onTap: () {
                              setState(() {
                                colorhombre = Colors.lightBlue.shade300;
                                colormujer = Colors.grey.shade300;
                                genero = "hombre";
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 75,
                          width: 40,
                          // height: MediaQuery.of(context).size.height * 0.12,
                          // width: MediaQuery.of(context).size.width * 0.078,

                          child: InkWell(
                            child: Image.asset(
                              'assets/icono_mujer.png',
                              color: colormujer,
                            ),
                            onTap: () {
                              setState(() {
                                colormujer = Colors.lightBlue.shade300;
                                colorhombre = Colors.grey.shade300;
                                genero = "mujer";
                              });
                            },
                          ),

                          // child: IconButton(
                          //   icon: const Icon(Icons.woman_sharp, size: 50),
                          //   color:
                          //       isButton2Pressed ? Colors.green : Colors.grey,
                          //   onPressed: () {
                          //     setState(() {
                          //       isButton1Pressed = false;
                          //       isButton2Pressed = true;
                          //     });
                          //     themacolor.setColorQ();
                          //   },
                          //   alignment: Alignment.bottomLeft,
                          //   visualDensity: VisualDensity.compact,
                          //   splashRadius: 24.0,
                          //   tooltip: 'Femenino',
                          //   iconSize: 24.0,
                          // ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            children: [
                              Text(
                                'ALTURA',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              TextField(
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                controller: _altura,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 15),
                                ),
                              )
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.125,
                              child: Text(
                                'cm',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Column(
                            children: [
                              Text(
                                'PESO',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                              TextField(
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.quicksand(
                                      textStyle: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  controller: _peso,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 15),
                                  ))
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.width * 0.125,
                              child: Text(
                                'Kg',
                                style: GoogleFonts.quicksand(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.green[300]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'CALCULAR',
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        if (_peso.text.isEmpty ||
                            _edad.text.isEmpty ||
                            _altura.text.isEmpty ||
                            genero == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Por favor, complete todos los campos.",
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          // pesosProvider.getCategoriaxIMC(
                          //     double.parse(_peso.text),
                          //     double.parse(_altura.text));
                          pesosProvider.mensajeIMC(
                              double.parse(_peso.text),
                              double.parse(_altura.text),
                              int.parse(_edad.text));
                          cambiarcolorProvider.cambiamosdecolor2(
                              pesosProvider.msg, int.parse(_edad.text));
                          cambiaredadnombre.nombreedad(
                              genero, int.parse(_edad.text));
                          // cambiarcolor(pesosProvider.msg);
                          colormujer = Colors.grey.shade300;
                          colorhombre = Colors.grey.shade300;
                          _peso.clear();
                          _altura.clear();
                          _edad.clear();
                          genero = "";
                        }
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          cambiarcolorProvider.colorido2,
                          cambiarcolorProvider.colorido,
                        ])),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cambiaredadnombre.edadnombre,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "IMC:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${pesosProvider.imc}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        "Peso Ideal:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "(Referencial)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "15.5" + "Kg",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Text("AQUI VA LO DE JHON"),
        ],
      ),
    );
  }
}
