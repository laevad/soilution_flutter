

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:soilution_flutter/app/page/start/start_view.dart';

class SplashController extends Controller{

  @override
  void initListeners() {
    Future.delayed(const Duration(seconds: 1)).then((value) {
      Navigator.of(
          getContext()).pushReplacement(
          CupertinoPageRoute(builder:
              (context) => const StartView(),
          )
      );
    });
  }
}