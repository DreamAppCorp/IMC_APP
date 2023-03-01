import 'package:flutter/material.dart';

import 'package:imc_calcula_tu_peso_ideal/pages/imc.dart';
import 'package:imc_calcula_tu_peso_ideal/preferences/preferences.dart';
import 'package:imc_calcula_tu_peso_ideal/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => ThemeProvider(isDarkMode: Preferences.theme)),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      //theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const IMCPAGE(),
    );
  }
}
