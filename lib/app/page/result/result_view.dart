import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soilution_flutter/app/page/tap/tap_view.dart';

import '../../../constant.dart';
import '../../widgets/global_custom/custom_result_box.dart';
import 'result_controller.dart';

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
              alignment: Alignment.center,
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
                          subTitle: 'High Goethite',
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 30),
                        ElevatedButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, TapView.routeName),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 5),
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
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 35,
                  child: Text(
                    'Scanned Soil',
                    style: GoogleFonts.prompt(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                  width: 256,
                  height: 150,
                  top: MediaQuery.of(context).size.height / 14,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Constant.lightColorScheme.primary,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Constant.lightColorScheme.primary,
                          blurRadius: 4,
                          offset: const Offset(1, 3), // Shadow position
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/dummy.jpg",
                          ),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
