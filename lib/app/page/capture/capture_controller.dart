
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../help/help_view.dart';

class CaptureController extends Controller{




  @override
  void initListeners()  {
  }







  void onPressedHelp(){
    Navigator.push(
        getContext(),
        MaterialPageRoute(
            builder: (context) => const HelpView()
        )
    );
  }

}