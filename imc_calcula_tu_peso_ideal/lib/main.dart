import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:imc_calcula_tu_peso_ideal/pages/imc.dart';
import 'package:imc_calcula_tu_peso_ideal/preferences/preferences.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/cambiarcolor_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/edadnombre_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/peso_provider.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.theme)),
      ChangeNotifierProvider(create: (_) => PesoProvider()),
      ChangeNotifierProvider(create: (_) => CambiarColorProvider()),
      ChangeNotifierProvider(create: (_) => EdadNombre()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: [SystemUiOverlay.top,]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      //theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const IMCPAGE(),
    );
  }
}
