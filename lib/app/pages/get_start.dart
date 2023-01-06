import 'package:flutter/material.dart';
import 'package:soilution_flutter/app/widgets/custom_start_button.dart';

import '../../constant.dart';
import '../widgets/custom_box.dart';
import 'tap.dart';

class GetStart extends StatefulWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.lightColorScheme.primary,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomBox(),
            const CustomBox(
              height: 2.8,
              hero: 'mid',
              fit: BoxFit.fitHeight,
              image: "assets/images/logo3.png",
            ),
            Hero(
              tag: 'loading',
              child: CustomStartButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const Tap()));
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
