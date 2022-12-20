import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';
import '../widgets/custom_body_size_box.dart';
import '../widgets/custom_heading_size_box.dart';
import '../widgets/custom_loading_size_box.dart';
import 'get_start.dart';

class Splash extends StatefulWidget {
  static const routeName = "/splash";
  const Splash({Key? key}) : super(key: key);
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => const GetStart(),
      ));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.lightColorScheme.primary,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: const [
                    CustomHeadingSizeBox(),
                    CustomBodySizeBox(),
                    Hero(tag: 'loading',child: CustomLoadingSizeBox(),),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
