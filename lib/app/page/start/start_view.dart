import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../constant.dart';
import '../../widgets/global_custom/custom_box.dart';
import '../../widgets/start/start_custom_button.dart';
import 'start_controller.dart';

class StartView extends View {
  const StartView({Key? key}) : super(key: key);

  @override
  StartViewState createState() => StartViewState();
}

class StartViewState extends ViewState<StartView, StartController> {
  StartViewState() : super(StartController());

  @override
  Widget get view {
    return ControlledWidgetBuilder<StartController>(
      builder: (context, controller) {
        return Scaffold(
          key: globalKey,
          backgroundColor: Constant.lightColorScheme.primary,
          body: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomBox(),
                const CustomBox(
                  height: 3.1,
                  hero: 'mid',
                  image: "assets/images/start_mid.png",
                ),
                StartCustomButton(
                  onPressed: controller.onPressed,
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}
