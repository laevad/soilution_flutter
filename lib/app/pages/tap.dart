import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../widgets/custom_box.dart';
import '../widgets/custom_help_button.dart';
import 'capture.dart';
import 'help.dart';


class Tap extends StatefulWidget {
  const Tap({Key? key}) : super(key: key);

  @override
  State<Tap> createState() => _TapState();
}

class _TapState extends State<Tap> {

  void onPressedHelp() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const Help()));
  }

  void onPressedCapture() async {
    await availableCameras().then((value) => Navigator.push(context,
        MaterialPageRoute(builder: (context) => Capture(cameras: value))));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.lightColorScheme.primary,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              CustomHelpButton(
                onPressed: ()=> onPressedHelp(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              const CustomBox(
                height: 13,
                hero: '',
                image: "assets/images/tap.png",
                fit: BoxFit.fitWidth,
                isCustomWidth: true,
              ),
              GestureDetector(
                onTap: ()=> onPressedCapture(),
                child: const CustomBox(
                  height: 2.5,
                  hero: 'mid',
                  fit: BoxFit.fitHeight,
                  image: "assets/images/logo1.png",
                ),
              ),
            ]),
          )),
    );
  }
}
