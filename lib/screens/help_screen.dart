import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';


class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: ThemeData(
            colorScheme: Constant.lightColorScheme,
            textTheme: GoogleFonts.openSansTextTheme().apply(
                displayColor: const Color(0xFF383838),
                bodyColor: const Color(0xFF383838)),
            useMaterial3: true),
        child: Scaffold(
          appBar: AppBar(backgroundColor: const Color(0xFFffe36b),title:  Text('Help',  style: GoogleFonts.prompt(fontWeight: FontWeight.w500,color: Colors.black.withOpacity(0.7)),),),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.1,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/how.png",
                            ), fit: BoxFit.cover)
                    ),
                  ) ,),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.78,
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                      )),
                    child: Column(
                      children: [
                        ListTile(title: SizedBox(
                            height: 40.0,
                            width: 50.0, // fixed width and height
                            child: Image.asset(
                              'assets/images/tiny_1.png',
                               fit: BoxFit.fill,
                            )
                        ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
