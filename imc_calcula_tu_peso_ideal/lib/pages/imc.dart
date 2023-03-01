import 'package:flutter/material.dart';
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
  //final temacontroller = Get.put(TemaProvider());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMC',
          style: GoogleFonts.quicksand(
              textStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        actions: [
          Switch.adaptive(
              value: Preferences.theme,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.setColorQ() : themeP.setClaro();
                setState(() {});
              }),
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
                              TextField()
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.078,
                          child: Image.asset("assets/hombre.png"),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.078,
                          child: Image.asset("assets/mujer.png"),
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
                              TextField()
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
                              TextField()
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
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 177, 243, 33),
                          Color.fromARGB(255, 15, 255, 3),
                        ])),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "NIÑA",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height * 0.01,
                      // ),
                      Text(
                        "IMC:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "15.5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "Peso Ideal:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "(Referencial)",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Align(
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
          Text("AQUI VA LO DE JHON")
        ],
      ),
    );
  }
}
