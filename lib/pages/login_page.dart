import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            colorScheme: Constant.lightColorScheme,
            textTheme: GoogleFonts.openSansTextTheme().apply(
                displayColor: const Color(0xFF383838),
                bodyColor: const Color(0xFF383838)),
            useMaterial3: true),
        child:  Scaffold(
          backgroundColor: const Color(0xFFffe36a),
          body: SafeArea(
              child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3.0,

                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/soilution.png",
                                ), fit: BoxFit.cover)
                        ),
                      ),
                    ) ,),
                   SizedBox(
                     height: MediaQuery.of(context).size.height /3.9,
                     child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/dahon.png",
                            ), fit: BoxFit.contain)
                    ),
                  ) ,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height /2.2,
                    child: Container(
                    width: double.infinity,
                    decoration:  BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(10),
                        //   topRight: Radius.circular(10)
                        // ),
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/home_1.png",
                            ), fit: BoxFit.cover)
                    ),
                  ),
                  ),
                ],
              ),
            ],
          ),)),
        ));
  }
}
