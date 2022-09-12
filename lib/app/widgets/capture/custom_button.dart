import 'package:flutter/material.dart';

import '../../../constant.dart';


class CaptureCustomButton extends StatelessWidget {
  final IconData? icon;
  const CaptureCustomButton({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 60,
      width: 60,
      decoration:  BoxDecoration(
          shape: BoxShape.circle,
          color: Constant.lightColorScheme.primary,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2,2),
              blurRadius: 10,
            )
          ]
      ),
      child:  Icon(icon,
        color: Colors.black54,size: 45,
      ),
    );
  }
}
