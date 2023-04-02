import 'package:flutter/material.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/cambiarcolor_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/edadnombre_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/peso_provider.dart';

import 'package:imc_calcula_tu_peso_ideal/widgets/barra.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc_calcula_tu_peso_ideal/preferences/preferences.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/theme_provider.dart';

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
      body: ListView(
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
                          //-------------------------controller

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
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              pesosProvider.msg,
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.05,
                  child: Center(child: BarraColor()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                child: SizedBox(
                  height: 30,
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
                ),
              )
            ],
          ),
          //Barra de color------------------------>

          //Tabla de info---------------------------->
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.37,
            child: DataTable(columns: const [
              DataColumn(
                  label: Text('Categoria',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('aa',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ], rows: [
              DataRow(cells: [
                DataCell(Text(
                  'Delgadez muy extrema',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '< 16.0',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
              DataRow(cells: [
                DataCell(Text(
                  'Delgadez extrema',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '16.0 - 16.9',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
              DataRow(cells: [
                DataCell(Text(
                  'Delgadez',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '17.0 - 18.4',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
              DataRow(cells: [
                DataCell(Text(
                  'Normal',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '18.5 - 24.9',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
              DataRow(cells: [
                DataCell(Text(
                  'Sobrepeso',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '25.0 - 29.9',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
              DataRow(cells: [
                DataCell(Text(
                  'Obesidad Grado I',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '30.0 - 34.9',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
              DataRow(cells: [
                DataCell(Text(
                  'Obesidad Grado II',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
                DataCell(Text(
                  '35.0 - 39.9',
                  style: GoogleFonts.montserrat(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )),
              ]),
            ]),
          )
        ],
      ),
    );
  }
}
