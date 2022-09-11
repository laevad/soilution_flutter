import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:soilution_flutter/app/page/help/help_view.dart';

class TapController extends Controller{
  @override
  void initListeners() {

  }

  void onPressed(){
    Navigator.push(
        getContext(),
        MaterialPageRoute(
            builder: (context) => const HelpView()
        )
    );
  }
}