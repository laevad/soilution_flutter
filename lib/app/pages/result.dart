import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tflite_maven/tflite.dart';

import '../../api.dart';
import '../../constant.dart';
import '../widgets/custom_result_box.dart';

class Result extends StatefulWidget {
  static String routeName = '/resultView';

  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  var loading = false;
  late var output = [];
  late var munsell = "";
  late var args;
  File? _image;

  loadModel() async {
    await Tflite.loadModel(
        model: 'assets/data/model.tflite', labels: 'assets/data/labels.txt');
  }

  @override
  void initState() {
    loadModel().then((value) => setState(() {}));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    args = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{})
        as Map;
    predict();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  void predict() async {
    EasyLoading.show(status: 'loading...');
    loading = true;
    output = (await Tflite.runModelOnImage(
        path: args['image_path'],
        numResults: 4,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5))!;

    Map<String, String> body = {
      'clusters': "1",
    };
    var m = await Api().getSoil(body, args['image_path']);

    _image = args['image'];
    print(
        "*********************************************************************"
        "*");
    print(output);
    print(m);
    munsell = m;
    loading = false;
    EasyLoading.dismiss();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Shimmer getShimmerBoxLoading({
      double width = 150.0,
      double height = 150.0,
      Color? baseColor,
      Color? highlightColor,
    }) {
      return Shimmer.fromColors(
        baseColor: baseColor ?? Constant.lightColorScheme.primary,
        highlightColor:
            highlightColor ?? Constant.lightColorScheme.primary.withOpacity(.2),
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
          ),
          child: SizedBox(
            width: width,
            height: height,
          ),
        ),
      );
    }

    Shimmer getShimmerDetailLoading() {
      return Shimmer.fromColors(
        baseColor: Colors.yellow[300]!,
        highlightColor: Colors.green[300]!,
        child: Container(
          height: MediaQuery.of(context).size.height / 8.1,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Constant.lightColorScheme.primary,
                blurRadius: 4,
                offset: const Offset(2, 5), // Shadow position
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          width: MediaQuery.of(context).size.width / 1.2,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
      );
    }

    Shimmer getShimmerTextLoading() {
      return Shimmer.fromColors(
        baseColor: Colors.white.withOpacity(0.8),
        highlightColor: Colors.green.withOpacity(0.8),
        child: Container(
          height: MediaQuery.of(context).size.height / 34,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.green,
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
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  loading
                      ? getShimmerDetailLoading()
                      : CustomResultBox(
                          title: 'Munsell Values',
                          subTitle: munsell,
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  loading
                      ? getShimmerDetailLoading()
                      : CustomResultBox(
                          title: 'Soil Classification',
                          subTitle:
                              output != null ? "${output[0]['label']}" : 'N/A',
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  loading
                      ? getShimmerDetailLoading()
                      : const CustomResultBox(
                          title: 'Mineral Content',
                          subTitle: 'High Goethite',
                        ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  loading
                      ? getShimmerBoxLoading(
                          height: 40.0,
                          width: MediaQuery.of(context).size.width / 2,
                          baseColor: Colors.green.withOpacity(0.8),
                          highlightColor: Colors.grey[300])
                      : ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width / 5,
                            ),
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
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 35,
            child: loading
                ? getShimmerTextLoading()
                : Text(
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
            child: loading
                ? getShimmerBoxLoading()
                : Container(
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
                    ),
                    child: Image.file(_image!)),
          ),
        ],
      ),
    );
  }
}
