import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constant.dart';

class CustomResultBox extends StatelessWidget {
  final String title;
  final String subTitle;
  const CustomResultBox({Key? key, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            offset: const Offset(3, 6), // Shadow position
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      width: MediaQuery.of(context).size.width / 1.5,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.prompt(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subTitle,
            style: GoogleFonts.prompt(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
