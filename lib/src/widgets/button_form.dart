import 'package:flutter/material.dart';

class ButtonFormWidget extends StatelessWidget {
  final double widthPercent;
  final VoidCallback? onPressed;
  final Color? bgColor;
  final Text text;
  const ButtonFormWidget({
    super.key,
    this.widthPercent = 0.8,
    this.onPressed,
    required this.bgColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      width: MediaQuery.of(context).size.width * widthPercent,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          padding: const EdgeInsets.all(20),
        ),
        child: text,
      ),
    );
  }
}
