import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import 'package:soilution_flutter/app/page/splash/splash_controller.dart';

import '../../../constant.dart';
import '../../widgets/animation/loading_sizebox.dart';
import '../../widgets/splash/body_size_box.dart';
import '../../widgets/splash/heading_size_box.dart';

class SplashView extends View {
  const SplashView({Key? key}) : super(key: key);

  @override
  SplashViewState createState() => SplashViewState();
}

class SplashViewState extends ViewState<SplashView, SplashController> {
  SplashViewState() : super(SplashController());

  @override
  Widget get view {
    return Scaffold(
      key: globalKey,
      backgroundColor: Constant.lightColorScheme.primary,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
            children: [
              Column(
                children: const [
                  CustomHeadingSizeBox(),
                  CustomLoadingSizeBox(),
                  CustomBodySizeBox(),
                  CustomBodySizeBox(
                    height: 2.4,
                    image: "assets/images/home_1.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ],
          ),)),
    );
  }

}
