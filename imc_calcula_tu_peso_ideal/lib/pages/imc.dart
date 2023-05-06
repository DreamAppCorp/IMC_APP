import 'package:flutter/material.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/cambiarcolor_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/edadnombre_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/peso_provider.dart';

import 'package:imc_calcula_tu_peso_ideal/widgets/barra.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc_calcula_tu_peso_ideal/preferences/preferences.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/theme_provider.dart';

import 'dart:math' as math;

class IMCPAGE extends StatefulWidget {
  const IMCPAGE({super.key});

  @override
  State<IMCPAGE> createState() => _IMCPAGEState();
}

class _IMCPAGEState extends State<IMCPAGE> with SingleTickerProviderStateMixin {
  final TextEditingController _edad = TextEditingController();
  final TextEditingController _peso = TextEditingController();
  final TextEditingController _altura = TextEditingController();

  late final AnimationController controller;
  late final Animation movingRight;

  Color colormujer = Colors.grey.shade300;
  Color colorhombre = Colors.grey.shade300;
  String genero = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    movingRight = Tween(begin: 0.0, end: 0.0).animate(controller);
  }

// MediaQuery.of(context).size.width * 0.041
  @override
  Widget build(BuildContext context) {
    final pesosProvider = Provider.of<PesoProvider>(context);
    final themacolor = Provider.of<ThemeProvider>(context, listen: false);
    final cambiarcolorProvider = Provider.of<CambiarColorProvider>(context);
    final cambiaredadnombre = Provider.of<EdadNombre>(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.fromLTRB(14, 5, 17, 0),
          child: Row(
            children: [
              Text(
                'IMC',
                style: GoogleFonts.redHatDisplay(
                    textStyle: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w900)),
              ),
              const Spacer(),
              Row(
                children: [
                  // MaterialButton(
                  //     child: Image.asset(
                  //       "assets/arrow.png",
                  //       width: 5,
                  //     ),
                  //     minWidth: 0.1,
                  //     onPressed: () {}),
                  Container(
                    width: 24,
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.light_mode_outlined, size: 20),
                      color: !Preferences.theme
                          ? const Color.fromARGB(255, 10, 206, 162)
                          : Colors.grey,
                      onPressed: () {
                        setState(() {
                          Preferences.theme = false;
                        });
                        themacolor.setClaro();
                      },
                    ),
                  ),
                  Container(
                    width: 24,
                    child: IconButton(
                      highlightColor: Colors.transparent,
                      constraints: const BoxConstraints(),
                      icon: const Icon(Icons.dark_mode_outlined, size: 20),
                      color: Preferences.theme
                          ? const Color.fromARGB(255, 10, 206, 162)
                          : Colors.grey,
                      onPressed: () {
                        setState(() {
                          Preferences.theme = true;
                        });
                        themacolor.setColorQ();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        // Switch.adaptive(
        //     value: Preferences.theme,
        //     onChanged: (value) {
        //       Preferences.theme = value;
        //       final themeP =
        //           Provider.of<ThemeProvider>(context, listen: false);
        //       value ? themeP.setColorQ() : themeP.setClaro();
        //       setState(() {});
        //     }),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.03,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.365,
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.185,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'EDAD',
                                  style: GoogleFonts.redHatDisplay(
                                      textStyle: const TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w800)),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.redHatDisplay(
                                        textStyle: const TextStyle(
                                            height: 1,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800)),
                                    controller: _edad,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          bottom:
                                              14), // Padding para el contenido
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.04,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            child: Image.asset(
                              'assets/icono_hombre.png',
                              color: colorhombre,
                              width: 18,
                            ),
                            onTap: () {
                              setState(() {
                                colorhombre =
                                    const Color.fromARGB(255, 10, 206, 162);
                                colormujer = Colors.grey.shade300;
                                genero = "hombre";
                              });
                            },
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            child: Image.asset(
                              'assets/icono_mujer.png',
                              color: colormujer,
                              width: 21.2,
                            ),
                            onTap: () {
                              setState(() {
                                colormujer =
                                    const Color.fromARGB(255, 10, 206, 162);
                                colorhombre = Colors.grey.shade300;
                                genero = "mujer";
                              });
                            },
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.261,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'ALTURA',
                                  style: GoogleFonts.redHatDisplay(
                                      textStyle: const TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w800)),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.redHatDisplay(
                                        textStyle: const TextStyle(
                                            height: 1,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800)),
                                    controller: _altura,
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: 14),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Text(
                                'cm',
                                style: GoogleFonts.redHatDisplay(
                                    textStyle: const TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.261,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PESO',
                                  style: GoogleFonts.redHatDisplay(
                                      textStyle: const TextStyle(
                                          fontSize: 15.5,
                                          fontWeight: FontWeight.w800)),
                                ),
                                SizedBox(
                                  height: 25,
                                  child: TextField(
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.redHatDisplay(
                                          textStyle: const TextStyle(
                                              height: 1,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w800)),
                                      controller: _peso,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        contentPadding:
                                            EdgeInsets.only(bottom: 14),
                                      )),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).size.height *
                                      0.05),
                              Text(
                                'kg',
                                style: GoogleFonts.redHatDisplay(
                                    textStyle: const TextStyle(
                                        fontSize: 15.5,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.052,
                          width: MediaQuery.of(context).size.width * 0.344,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 10, 206, 162)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'CALCULAR',
                                style: GoogleFonts.redHatDisplay(
                                    textStyle: const TextStyle(
                                        fontSize: 14.1,
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
                            //-------------------------controller

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Por favor, complete todos los campos :3",
                                  style: GoogleFonts.redHatDisplay(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white)),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 10, 206, 162),
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

                            //---------controller

                            controller.reset();
                            controller.forward();
                            // cambiarcolor(pesosProvider.msg);
                            colormujer = Colors.grey.shade300;
                            colorhombre = Colors.grey.shade300;
                            _peso.clear();
                            _altura.clear();
                            _edad.clear();
                            genero = "";
                            //_--------------------------------------------------
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                height: MediaQuery.of(context).size.height * 0.365,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    gradient: LinearGradient(
                        transform: GradientRotation(-135),
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          cambiarcolorProvider.colorido,
                          cambiarcolorProvider.colorido2,
                        ])),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(23, 18, 23, 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cambiaredadnombre.edadnombre,
                        style: GoogleFonts.redHatDisplay(
                            textStyle: const TextStyle(
                                fontSize: 16.5,
                                fontWeight: FontWeight.w900,
                                color: Colors.white)),
                      ),
                      Text(
                        "IMC:",
                        style: GoogleFonts.redHatDisplay(
                            textStyle: const TextStyle(
                                fontSize: 15.6,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${pesosProvider.imc}',
                          style: GoogleFonts.redHatDisplay(
                              textStyle: const TextStyle(
                                  fontSize: 37,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Peso Ideal:",
                            style: GoogleFonts.redHatDisplay(
                                textStyle: const TextStyle(
                                    fontSize: 15.6,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                          Text(
                            "Referencial",
                            style: GoogleFonts.redHatDisplay(
                                textStyle: const TextStyle(
                                    height: 1,
                                    fontSize: 11.5,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.001,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "15" + "kg",
                          style: GoogleFonts.redHatDisplay(
                              textStyle: const TextStyle(
                                  fontSize: 37,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.038,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31),
            child: Text(
              pesosProvider.msg,
              style: GoogleFonts.redHatDisplay(
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                  fontSize: 17.9),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.011,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Center(child: BarraColor()),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              SizedBox(
                height: 13,
                child: SizedBox(
                  height: 50,
                  child: AnimatedBuilder(
                    animation: controller,
                    child: SizedBox(
                      height: 10,
                      child: Image.asset(
                        'assets/arrow.png',
                        color: Colors.white,
                      ),
                    ),
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(movingRight.value, 0.0),
                        child: child,
                      );
                    },
                  ),
                ),
              )
            ],
          ),
          //Barra de color------------------------>

          //Tabla de info---------------------------->
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.90,
          //   height: MediaQuery.of(context).size.height * 0.37,
          //   child: DataTable(columns: const [
          //     DataColumn(
          //         label: Text('Categoria',
          //             style: TextStyle(
          //                 fontSize: 18, fontWeight: FontWeight.bold))),
          //     DataColumn(
          //         label: Text('aa',
          //             style: TextStyle(
          //                 fontSize: 18, fontWeight: FontWeight.bold))),
          //   ], rows: [
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Delgadez muy extrema',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '< 16.0',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Delgadez extrema',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '16.0 - 16.9',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Delgadez',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '17.0 - 18.4',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Normal',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '18.5 - 24.9',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Sobrepeso',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '25.0 - 29.9',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Obesidad Grado I',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '30.0 - 34.9',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //     DataRow(cells: [
          //       DataCell(Text(
          //         'Obesidad Grado II',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //       DataCell(Text(
          //         '35.0 - 39.9',
          //         style: GoogleFonts.montserrat(
          //             fontSize: 20, fontWeight: FontWeight.w500),
          //       )),
          //     ]),
          //   ]),
          // ),
          SizedBox(
                  height: MediaQuery.of(context).size.height * 0.0165,
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delgadez muy extrema',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '< 16.0',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delgadez extrema',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '16.0 - 16.9',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delgadez',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '17.0 - 18.4',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Normal',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '18.5 - 24.9',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sobrepeso',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '25.0 - 29.9',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Obesidad Grado I',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '30.0 - 34.9',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.008,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Obesidad Grado II',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '35.0 - 39.9',
                      style: GoogleFonts.redHatDisplay(
                          fontSize: 15.4, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
