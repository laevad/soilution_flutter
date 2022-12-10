import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoadingSizeBox extends StatelessWidget {
  final double? height;
  final Color? color;
  final double? size;
  const CustomLoadingSizeBox(
      {Key? key, this.height = 4.5, this.color = Colors.green, this.size = 65})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / height!,
      child: SpinKitThreeInOut(
        color: color!,
        size: size!,
      ),
    );
  }
}
