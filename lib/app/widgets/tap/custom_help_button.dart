import 'package:flutter/material.dart';

class CustomHelpButton extends StatelessWidget {
  final Function? onPressed;
  const CustomHelpButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 41, right: 34, left: 34),
      child: ListTile(
        trailing: GestureDetector(
          onTap: () => onPressed!(),
          child: Hero(
            tag: 'helpBtn',
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/cq_0.png",
                      ),
                      fit: BoxFit.contain)),
            ),
          ),
        ),
      ),
    );
  }
}
