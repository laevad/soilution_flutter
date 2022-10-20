import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilution_flutter/app/page/result/result_controller.dart';

import '../../../constant.dart';
import '../../widgets/global_custom/custom_result_box.dart';

class ResultView extends View {
  static String routeName = '/resultView';
  const ResultView({Key? key}) : super(key: key);

  @override
  ResultViewState createState() => ResultViewState();
}

class ResultViewState extends ViewState<ResultView, ResultController> {
  ResultViewState() : super(ResultController());

  @override
  // TODO: implement view
  Widget get view => ControlledWidgetBuilder<ResultController>(
        builder: (context, controller) {
          var _opacity = 1.0;
          var _xOffset = 0.0;
          var _yOffset = 0.0;
          var _blurRadius = 0.0;
          var _spreadRadius = 0.0;

          return Scaffold(
            backgroundColor: Colors.green,
            key: globalKey,
            appBar: AppBar(
              backgroundColor: Constant.lightColorScheme.primary,
              title: Text(
                'RESULTS',
                style: GoogleFonts.prompt(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.7)),
              ),
            ),
            body: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.only(bottom: 15),
                    width: MediaQuery.of(context).size.width / 1,
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 8),
                        const CustomResultBox(
                          title: 'Munshell Values',
                          subTitle: '10R 5/10',
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        const CustomResultBox(
                          title: 'Soil Classification',
                          subTitle: 'Loam',
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 25),
                        const CustomResultBox(
                          title: 'Mineral Content',
                          subTitle: 'High GoeThite',
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 4),
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            'DONE',
                            style: GoogleFonts.prompt(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
