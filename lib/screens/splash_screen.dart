import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';
import '/screens/start_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => const LoginScreen(),));
    });
  }
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
          backgroundColor: const Color(0xFFffe36b),
          body: SafeArea(
              child: SingleChildScrollView(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Hero(
                            tag: 'title',
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/soilution.png",
                                      ), fit: BoxFit.cover)
                              ),
                            ),
                          ),
                        ) ,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /10,
                        child: const SpinKitThreeInOut(
                          color: Colors.green,
                          size: 85,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height /4,
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
                        height: MediaQuery.of(context).size.height / 2.4,
                        child: Container(
                          width: double.infinity,
                          decoration:  const BoxDecoration(
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
