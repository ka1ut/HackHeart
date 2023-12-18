import 'dart:async';
import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  final Function(int) onNumberSelected;
  final int initialCountdownTime;

  CountDown({Key? key,
    required this.onNumberSelected,
    required this.initialCountdownTime
  }) : super(key: key);

  @override
  _CountDownState createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  int countdownTime = 5; // 初期カウントダウン時間
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    countdownTime = widget.initialCountdownTime; // 初期カウントダウン時間を設定
    startCountdown();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdownTime > 0) {
        setState(() {
          countdownTime--;
        });
        widget.onNumberSelected(countdownTime);
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // not shown
  }
}
