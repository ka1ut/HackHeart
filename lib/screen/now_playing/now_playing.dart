//プレイしているページ
//1. 最初にプレイヤーの確認
//2. プレイ前の準備カウントダウン
//3. プレイ中のカウントダウン

import 'package:flutter/material.dart';
import '../../components/count_down/count_down.dart';
import '../../components/circle_button/circle_button.dart';

class GamePage extends StatefulWidget {
  final int selectedNumber;
  const GamePage({Key? key, required this.selectedNumber}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isReady = false;
  bool isCountdownFinished = false;
  int coutDownTime = 5; //タイマーの初期時間(プレイ時間)

  void handleReady() {
    setState(() {
      isReady = true;
    });
  }

  void handleCountdownTime(int time) {
    setState(() {
      coutDownTime = time;
      if (time == 0) {
        isCountdownFinished = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ゲームページ'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('${widget.selectedNumber}目の人は準備してください'),
              CustomCircleButton(
                text: isReady ? coutDownTime.toString() : 'OK',
                onPressed: handleReady,
              ),
              if (isReady)
                CountDown(
                  onNumberSelected: handleCountdownTime,
                  initialCountdownTime: 5,
                ),
              if (isCountdownFinished)
                Text('カウントダウンが終了しました'),

            ],
          )
      ),
    );
  }
}
