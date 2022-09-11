import 'package:flutter/material.dart';

class CustomBodySizeBox extends StatelessWidget {
  final double? height;
  final String? image;
  final BoxFit? fit;
  const CustomBodySizeBox(
      {
        Key? key,
        this.height=4,
        this.image="assets/images/dahon.png",
        this.fit=BoxFit.contain
      }
      ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / height!,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  image!,
                ), fit: fit!)
        ),
      ) ,);
  }
}
