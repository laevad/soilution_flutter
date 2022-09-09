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
        child:   Scaffold(
          backgroundColor: const Color(0xFFffe36b),
          body: SafeArea(child: SingleChildScrollView(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.2,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/start_title.png",
                              ), fit: BoxFit.cover)
                      ),
                    ) ,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.1,
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/start_mid.png",
                              ), fit: BoxFit.cover)
                      ),
                    ) ,),
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width /1.8,
                      height: 60,
                      child: ElevatedButton(onPressed: () {
                      },style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.green, // foreground
                      ),
                          child: const Text('GET STARTED', style: TextStyle(fontSize: 16, color: Colors.white),)),
                    ),
                  )
                  ),
                ],
              )
            ],
          ),)),),
        );
  }
}
