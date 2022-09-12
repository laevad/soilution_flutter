import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHelpBox extends StatelessWidget {
  final String? image;
  final String? text;
  const CustomHelpBox({
    Key? key,
    this.image = 'assets/images/tiny_1.png',
    this.text = 'By tapping the Soilution logo in the first page, '
        'you are to go in the next page that lets you capture soil image. ',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image!, height: 70),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 250,
          child: Text(
            text!,
            style: GoogleFonts.prompt(fontSize: 15, color: Colors.white),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
