import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';



class TapScreen extends StatelessWidget {
  const TapScreen({Key? key}) : super(key: key);

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
        // appBar: AppBar(backgroundColor: Colors.transparent, toolbarHeight: 40),
        backgroundColor: const Color(0xFFffe36b),
        body: SafeArea(child: SingleChildScrollView(child:
        Column(
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 41,right: 34, left: 34),
            child: ListTile(trailing: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/cq_0.png",
                      ), fit: BoxFit.contain)
              ),
            ),),
          ),
              SizedBox(  height: MediaQuery.of(context).size.height /12 ,),
              SizedBox(
                  height: MediaQuery.of(context).size.height /13,
                  child: Hero(
                    tag: 'title',
                    child: Container(
                      width: 255,
                decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/tap.png",
                          ), fit: BoxFit.fitWidth)
                ),
              ),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.9,
                child: Hero(
                  tag: 'mid',
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/start_mid.png",
                            ), fit: BoxFit.cover)
                    ),
                  ),
                ) ,),
        ]),
        )),),
    );
  }
}
