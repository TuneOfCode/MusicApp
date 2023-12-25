import 'package:flutter/material.dart';

class SocialButtonWidget extends StatelessWidget {
  final Widget? icon;
  final double width;
  final double height;
  const SocialButtonWidget({
    super.key,
    required this.icon,
    this.width = 80,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[600],
            padding: const EdgeInsets.all(20),
          ),
          child: icon,
        ),
      ),
    );
  }
}
