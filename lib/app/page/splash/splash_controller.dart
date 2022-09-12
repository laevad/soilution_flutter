import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../start/start_view.dart';

class SplashController extends Controller {
  @override
  void initListeners() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(getContext()).pushReplacement(CupertinoPageRoute(
        builder: (context) => const StartView(),
      ));
    });
  }
}
