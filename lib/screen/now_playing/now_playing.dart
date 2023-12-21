//プレイしているページ
//1. 最初にプレイヤーの確認
//2. プレイ前の準備カウントダウン
//3. プレイ中のカウントダウン

import 'package:flutter/material.dart';
import '../../components/count_down/count_down.dart';
import '../../components/circle_button/circle_button.dart';

import '../../components/text_button/text_button.dart';

import '../score/score_screen.dart';
import '../../score/AccelerometerResultsPerGame.dart';
import '../../participant/Participant.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:async';


class GamePage extends StatefulWidget {
  final int selectedNumber;
  const GamePage({Key? key, required this.selectedNumber}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool isReady = false;
  bool isCountdownFinished = false;
  int countDownTime = 5; //タイマーの初期時間(プレイ時間)
  int currentTime = 0;
  Participant participant = Participant.getInstance(9999);

  ThreeDPoint currentAcceleromaterPoint = ThreeDPoint.def();


  void initState() {
    super.initState();

    participant = Participant.getInstance(widget.selectedNumber);
    accelerometerEventStream(samplingPeriod: const Duration(milliseconds: 250)).listen(
          (sensorvalue) {
        setState(() {
          var point = ThreeDPoint(sensorvalue.x, sensorvalue.y, sensorvalue.z);
          print("x: ${point.x}, y: ${point.y}, z: ${point.z}");
          currentAcceleromaterPoint = point;
        });
      },
    );

    Timer.periodic(
      // 第一引数：繰り返す間隔の時間を設定
      const Duration(milliseconds: 200),
      // 第二引数：その間隔ごとに動作させたい処理を書く
      (Timer timer) {
        if(!isReady) return;
        currentTime++;
        if(countDownTime < currentTime/200) return;
        participant.addScore(currentAcceleromaterPoint);
      },
    );
  }

  void handleReady() {
    setState(() {
      isReady = true;
    });
  }

  void handleCountdownTime(int time) {
    setState(() {
      countDownTime = time;
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
          Text('${widget.selectedNumber}番目の人は準備してください'),
          CustomCircleButton(
            text: isReady ? countDownTime.toString() : 'OK',
            onPressed: () async {
              handleReady();

            },
          ),
          if (isReady)
            CountDown(
              onNumberSelected: handleCountdownTime,
              initialCountdownTime: countDownTime, //初期カウントダウン時間
            ),
          if (isCountdownFinished) Text('カウントダウンが終了しました'),
          CustomButton(

            text: '次へ',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ScorePage(widget.selectedNumber)),
              );
            },
          ),
        ],
      )),
    );
  }
}
