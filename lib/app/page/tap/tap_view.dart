import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:soilution_flutter/app/page/tap/tap_controller.dart';

import '../../../constant.dart';
import '../../widgets/global_custom/custom_box.dart';
import '../../widgets/tap/custom_help_button.dart';


class TapView extends View {
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
              child: Column(
            children: [
               CustomHelpButton(onPressed: controller.onPressed,),
              SizedBox(  height: MediaQuery.of(context).size.height /12 ,),
              const CustomBox(
                height: 13,
                hero: 'title',
                image: "assets/images/tap.png",
                fit: BoxFit.fitWidth,
                isCustomWidth: true,
              ),
              const CustomBox(
                height: 2.9,
                hero: 'mid',
                image: "assets/images/start_mid.png",
              ),
            ]),
        )),);
    },);
  }
}
