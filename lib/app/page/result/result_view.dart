import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:soilution_flutter/app/page/result/result_controller.dart';

class ResultView extends View {
  static
  String routeName = '/resultView';
  const ResultView({Key? key}) : super(key: key);

  @override
  ResultViewState createState() => ResultViewState();
}

class ResultViewState extends ViewState<ResultView, ResultController> {
  ResultViewState() : super(ResultController());



  @override
  // TODO: implement view
  Widget get view => ControlledWidgetBuilder<ResultController>(builder: (context, controller) =>
      Scaffold(
        key: globalKey,
        appBar: AppBar(),
      ),);
}
