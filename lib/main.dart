import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilution_flutter/app/page/splash/splash_view.dart';

import 'constant.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soilution App',
      theme: ThemeData(
        colorScheme: Constant.lightColorScheme,
        textTheme: GoogleFonts.openSansTextTheme().apply(
            displayColor: const Color(0xFF383838),
            bodyColor: const Color(0xFF383838)),
        useMaterial3: true,
      ),
      home: const SplashView(),
    );
  }
}
