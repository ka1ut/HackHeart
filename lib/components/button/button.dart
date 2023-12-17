import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return OutlinedButton(
    child: Text(text),
    style: OutlinedButton.styleFrom(
      primary: Color.fromARGB(255, 0, 0, 0),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: BorderSide(color: Color.fromARGB(255, 114, 114, 114)), // ここで枠線の色を赤に設定
    ),
    onPressed: onPressed,
  );
}



}
