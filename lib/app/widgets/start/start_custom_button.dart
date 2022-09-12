import 'package:flutter/material.dart';

class StartCustomButton extends StatelessWidget {
  final Function? onPressed;
  const StartCustomButton({Key? key, required this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
            height: 60,
            child: ElevatedButton(
                onPressed: () => onPressed!(),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  'GET STARTED',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                )),
          ),
        ));
  }
}
