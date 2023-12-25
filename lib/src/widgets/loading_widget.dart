import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: SizedBox(
        height: 200,
        child: CircularProgressIndicator(
          color: Colors.blue[800],
        ),
      ),
    );
  }
}
