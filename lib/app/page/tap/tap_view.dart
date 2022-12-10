import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../constant.dart';
import '../../../api.dart';
import '../../widgets/global_custom/custom_box.dart';
import '../../widgets/tap/custom_help_button.dart';
import 'tap_controller.dart';

class TapView extends View {
  static String routeName = '/tap-view';
  const TapView({Key? key}) : super(key: key);

  @override
  TapViewState createState() => TapViewState();
}

class TapViewState extends ViewState<TapView, TapController> {
  TapViewState() : super(TapController());

  @override
  Widget get view {
    return ControlledWidgetBuilder<TapController>(
      builder: (context, controller) {
        return Scaffold(
          key: globalKey,
          backgroundColor: Constant.lightColorScheme.primary,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(children: [
              CustomHelpButton(
                onPressed: controller.onPressedHelp,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              const CustomBox(
                height: 13,
                hero: 'title',
                image: "assets/images/tap.png",
                fit: BoxFit.fitWidth,
                isCustomWidth: true,
              ),
              GestureDetector(
                onTap: controller.onPressedCapture,
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
      },
    );
  }
}
