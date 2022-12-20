import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilution_flutter/app/pages/result.dart';

import 'app/pages/splash.dart';
import 'constant.dart';

void main() {
  configLoading();
  runApp(const MyApp());
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.dualRing
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.green
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.green
    ..textColor = Colors.white
    ..textStyle =
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.green)
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..loadingStyle = EasyLoadingStyle.custom
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soilution App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      title: 'Soilution App',
      theme: ThemeData(
        colorScheme: Constant.lightColorScheme,
        textTheme: GoogleFonts.openSansTextTheme().apply(
            displayColor: const Color(0xFF383838),
            bodyColor: const Color(0xFF383838)),
        useMaterial3: true,
      ),
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        Result.routeName: (context) => const Result(),
      },
    );
  }
}
