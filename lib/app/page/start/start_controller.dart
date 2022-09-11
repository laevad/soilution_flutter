import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:soilution_flutter/app/page/tap/tap_view.dart';


class StartController extends Controller{

  @override
  void initListeners() {
  }

  void onPressed(){
    Navigator.pushReplacement(
        getContext(),
        MaterialPageRoute(
            builder: (context) => const TapView()
        )
    );
  }
}