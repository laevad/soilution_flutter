import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final String? hero;
  final double? height;
  final String? image;
  final BoxFit? fit;
  final bool? isCustomWidth;
  const CustomBox({
    Key? key,
    this.height = 3.2,
    this.hero = 'title',
    this.image = "assets/images/start_title.png",
    this.fit = BoxFit.cover,
    this.isCustomWidth = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / height!,
      child: Hero(
        tag: hero!,
        child: Container(
          width: isCustomWidth! ? 255 : double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  image!,
                ),
                fit: fit),
          ),
        ),
      ),
    );
  }
}