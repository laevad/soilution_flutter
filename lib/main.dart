import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app/page/tap/tap_view.dart';

import 'app/page/result/result_view.dart';
import 'app/page/splash/splash_view.dart';
import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    FlutterCleanArchitecture.debugModeOn();
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soilution App',
      theme: ThemeData(
        colorScheme: Constant.lightColorScheme,
        textTheme: GoogleFonts.openSansTextTheme().apply(
            displayColor: const Color(0xFF383838),
            bodyColor: const Color(0xFF383838)),
        useMaterial3: true,
      ),
      initialRoute: TapView.routeName,
      routes: {
        SplashView.routeName: (context) => const SplashView(),
        ResultView.routeName: (context) => const ResultView(),
        TapView.routeName: (context) => const TapView(),
      },
    );
  }
}
