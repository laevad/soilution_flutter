import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:soilution_flutter/app/page/result/result_view.dart';

import '../capture/capture_view.dart';
import '../help/help_view.dart';

class TapController extends Controller {
  @override
  void initListeners() {}

  void onPressedHelp() {
    Navigator.push(getContext(),
        MaterialPageRoute(builder: (context) => const HelpView()));
  }

  void onPressedCapture() async {
    // await availableCameras().then((value) => Navigator.push(
    //     getContext(),
    //     MaterialPageRoute(
    //         builder: (context) => CaptureView(
    //               cameras: value,
    //             ))));

    Navigator.pushNamed(getContext(), ResultView.routeName);
  }
}
