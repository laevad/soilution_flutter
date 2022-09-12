import 'package:flutter/material.dart';

class CustomHeadingSizeBox extends StatelessWidget {
  final String? hero;
  final double? height;
  final String? image;
  const CustomHeadingSizeBox(
      {Key? key,
      this.hero = 'title',
      this.height = 4,
      this.image = "assets/images/soilution.png"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / height!,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Hero(
          tag: hero!,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      image!,
                    ),
                    fit: BoxFit.cover)),
          ),
        ),
      ),
    );
  }
}
