import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../constant.dart';
import '../../widgets/animation/loading_sizebox.dart';
import '../../widgets/splash/body_size_box.dart';
import '../../widgets/splash/heading_size_box.dart';
import 'splash_controller.dart';

class SplashView extends View {
  static String routeName = '/splash-view';
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
