import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            colorScheme: Constant.lightColorScheme,
            textTheme: GoogleFonts.openSansTextTheme().apply(
                displayColor: const Color(0xFF383838),
                bodyColor: const Color(0xFF383838)),
            useMaterial3: true),
        child:  const Scaffold(
          backgroundColor: Color(0xFFffe36b),
          body: Center(child: Text('center'),),
        ));
  }
}
