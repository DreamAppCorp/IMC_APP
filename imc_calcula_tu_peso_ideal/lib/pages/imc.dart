import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        title: const Text("hola"),
        actions: [
          Switch.adaptive(
              value: Preferences.theme,
              onChanged: (value) {
                Preferences.theme = value;
                final themeP =
                    Provider.of<ThemeProvider>(context, listen: false);
                value ? themeP.setOscuro() : themeP.setClaro();
                setState(() {});
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            child: Container(color: Colors.amber, child: const Text("WHITE")),
            onTap: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            child: Container(color: Colors.amber, child: const Text("NEGRO")),
            onTap: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            child: Container(color: Colors.amber, child: const Text("BLUE")),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
