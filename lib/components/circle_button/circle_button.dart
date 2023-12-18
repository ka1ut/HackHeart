import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomCircleButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: const TextStyle(fontSize: 30),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(60),
      ),
      onPressed: onPressed,
    );
  }
}
